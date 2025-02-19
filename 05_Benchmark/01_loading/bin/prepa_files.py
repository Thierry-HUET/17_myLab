#!/usr/bin/env python3

import pandas as pd
import psutil
import math
import logging
import os
import matplotlib.pyplot as plt


logging.basicConfig(
    level=logging.DEBUG, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)

os.listdir(os.path.abspath(''))
# Charger le fichier CSV en une DataFrame
logger.info("Chargement du fichier...")
DATADIR = os.path.join('/','Volumes','T7','data')
fn = os.path.join(DATADIR, 'StockEtablissementHistorique_utf8.csv')
df = pd.read_csv(fn, sep=',',dtype=str)
logger.info("Fichier chargé...")

# Détermination du nombre de fichiers à générer
nb_lignes = 88_324_443 #len(df.index)
temps_csv= []
temps_pqt= []
axe_x = []
process = psutil.Process()
for i in range(1,int(math.log(nb_lignes)+1)*2):
    nb_ln = min(nb_lignes, int(math.exp(i/2)))
    axe_x.append(nb_ln)
    start_time = process.cpu_times().user
    fn_csv = f"stock_{nb_ln:011_d}.csv"
    df[:nb_ln].to_csv(os.path.join(DATADIR,fn_csv), index=False)
    end_time = process.cpu_times().user
    temps_csv.append(end_time - start_time)

    start_time = process.cpu_times().user
    fn_pqt = f"stock_{nb_ln:011_d}.parquet"
    df[:nb_ln].to_parquet(os.path.join(DATADIR,fn_pqt), index=False, compression=None, engine='pyarrow')
    end_time = process.cpu_times().user
    temps_pqt.append(end_time - start_time)

    logger.info(f"Fichiers {nb_ln:011_d} créés...")

# Sauvegarde des données
df_sav = pd.DataFrame( columns=axe_x)
df_sav.loc[len(df_sav)] = temps_csv
df_sav.loc[len(df_sav)] = temps_pqt
df_sav.to_excel(os.path.join(DATADIR,'data.xlsx'), index=False)

# Création des graphes
plt.plot(axe_x, temps_csv, marker='o', label='CSV')
plt.plot(axe_x, temps_pqt, marker='o', label='Parquet')
plt.xscale('log')
plt.yscale('log')
plt.xlabel('Nombre de lignes')
plt.ylabel('Temps (secondes)')
plt.title('Temps d\'écriture du fichier CSV en fonction du nombre de lignes')
plt.grid(True)
plt.legend()
plt.show()
