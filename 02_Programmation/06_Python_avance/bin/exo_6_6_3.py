import psutil
import time
from rich.console import Console
from rich.table import Table

console = Console()

def afficher_stats():
    table = Table(title="Supervision Système")

    table.add_column("Ressource", style="cyan", no_wrap=True)
    table.add_column("Utilisation", style="magenta")

    cpu = psutil.cpu_percent(interval=1)
    mem = psutil.virtual_memory()
    disk = psutil.disk_usage('/')

    table.add_row("CPU", f"{cpu}%")
    table.add_row("Mémoire", f"{mem.percent}% ({mem.used // (1024**2)} Mo / {mem.total // (1024**2)} Mo)")
    table.add_row("Disque", f"{disk.percent}% ({disk.used // (1024**3)} Go / {disk.total // (1024**3)} Go)")

    console.clear()
    console.print(table)

for _ in range(15):  # 15 fois toutes les 2 secondes = 30 secondes
    afficher_stats()
    time.sleep(2)
