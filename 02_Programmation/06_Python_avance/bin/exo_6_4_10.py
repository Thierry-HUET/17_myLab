
import csv
import requests
import pyarrow as pa
import pyarrow.parquet as pq

# 1. Télécharger le fichier CSV
url = "https://www.data.gouv.fr/fr/datasets/r/69d7461e-9849-4641-a5c6-fa90cee2f56b"
csv_filename = "data.csv"
with open(csv_filename, "wb") as f:
    f.write(requests.get(url).content)

# 2. Lire le fichier CSV
with open(csv_filename, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    rows = list(reader)

# 3. Conversion en table Arrow
table = pa.Table.from_pylist(rows)

# 4. Sauvegarde au format Parquet
pq.write_table(table, "data.parquet")

# 5. Bonus : affichage des 5 premières lignes
print(table.slice(0, 5))