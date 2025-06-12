#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Script de génération d'un PDF à partir d'un registre de navires en CSV.

Télécharge un fichier CSV, filtre les navires de plus de 20 mètres,
et génère un PDF structuré avec Jinja2 et xhtml2pdf.
"""

import requests
import csv
from jinja2 import Template
from xhtml2pdf import pisa
from datetime import datetime
import logging
import pandas as pd

# Configuration du journal de logs
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

def telecharger_csv(url):
    """Télécharge le fichier CSV depuis l'URL spécifiée."""
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return response.content.decode("utf-8")
    except requests.RequestException as error:
        logging.error("Erreur lors du téléchargement du fichier CSV : %s", error)
        return None

def lire_csv(csv_content):
    """Lit le contenu CSV et filtre les navires de plus de 20 mètres."""
    navires = []
    reader = csv.DictReader(csv_content.splitlines())
    for row in reader:
        try:
            longueur = float(row["longueur_hors_tout"])
            if longueur > 20:
                navires.append({
                    "nom_bateau": row["nom_bateau"],
                    "immatriculation": row["immatriculation"],
                    "type_navire": row["type_navire"],
                    "longueur_hors_tout": longueur,
                    "port_d_attache": row["port_d_attache"]
                })
        except (ValueError, KeyError):
            continue
    return navires[:20]

def generer_html(navires):
    """Génère le contenu HTML à partir des données des navires."""
    template_html = """
    <!DOCTYPE html>
    <html lang='fr'>
    <head>
      <meta charset='UTF-8'>
      <title>Registre des navires</title>
      <style>
        body { font-family: Arial, sans-serif; }
        h1 { text-align: center; color: navy; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #000; padding: 8px; }
        th { background-color: #f2f2f2; }
      </style>
    </head>
    <body>
      <h1>Registre des navires</h1>
      <p>Date : {{ date }}</p>
      <table>
        <tr>
          <th>Nom du bateau</th>
          <th>Immatriculation</th>
          <th>Type de navire</th>
          <th>Longueur hors tout (m)</th>
          <th>Port d'attache</th>
        </tr>
        {% for navire in navires %}
        <tr>
          <td>{{ navire.nom_navire }}</td>
          <td>{{ navire.num_immat_francais }}</td>
          <td>{{ navire.type_carburant }}</td>
          <td>{{ navire.longueur_hors_tout }}</td>
          <td>{{ navire.quartier }}</td>
        </tr>
        {% endfor %}
      </table>
    </body>
    </html>
    """
    template = Template(template_html)
    return template.render(navires=navires, date=datetime.now().strftime("%Y-%m-%d"))

def generer_pdf(html_content, output_filename):
    """Génère un fichier PDF à partir du contenu HTML."""
    try:
        with open(output_filename, "wb") as fichier_pdf:
            status = pisa.CreatePDF(html_content, dest=fichier_pdf)
        if status.err:
            logging.error("Erreur lors de la génération du PDF.")
        else:
            logging.info("Le fichier %s a été généré avec succès.", output_filename)
    except Exception as error:
        logging.error("Erreur lors de la génération du PDF : %s", error)

def main():
    """Point d'entrée principal du script."""
    url = "https://www.data.gouv.fr/fr/datasets/r/69d7461e-9849-4641-a5c6-fa90cee2f56b"
    url = 'navires.csv'
    df = pd.read_csv(url,sep=',')
    df['longueur_hors_tout'] = df['longueur_hors_tout'].str.replace(',', '.')
    df['longueur_hors_tout'] = pd.to_numeric(df['longueur_hors_tout'])
    df_new = df[df['longueur_hors_tout']>=20.0]
    df_new = df_new[['nom_navire','num_immat_francais','type_carburant','longueur_hors_tout','quartier']]
    df_new = df_new.to_dict('records')
    html = generer_html(df_new)
    generer_pdf(html, "navires.pdf")

if __name__ == "__main__":
    main()