import time
import paramiko
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import os

# Configuration
remote_file_path = "/home/tempo/requirements.txt"
local_directory = "."
local_file_path = os.path.join(local_directory, "toto.txt")
hostname = "aperto-nota.fr"
port = 22
username = "tempo"
password = "usertempo"

# Téléchargement du fichier via SSH
def telecharger_fichier():
    try:
        transport = paramiko.Transport((hostname, port))
        transport.connect(username=username, password=password)
        sftp = paramiko.SFTPClient.from_transport(transport)

        sftp.get(remote_file_path, local_file_path)

        sftp.close()
        transport.close()
        print("Fichier téléchargé avec succès.")
    except Exception as e:
        print(f"Erreur lors du téléchargement : {e}")

# Surveillance du fichier local
class SurveillanceHandler(FileSystemEventHandler):
    def on_any_event(self, event):
        print(f"Événement détecté : {event.event_type} sur {event.src_path}")

    def on_modified(self, event):
        if os.path.basename(event.src_path) == "toto.txt":
            print(f"Le fichier {event.src_path} a été modifié.")

    def on_created(self, event):
        if os.path.basename(event.src_path) == "toto.txt":
            print(f"Le fichier {event.src_path} a été créé.")

    def on_moved(self, event):
        if os.path.basename(event.dest_path) == "toto.txt":
            print(f"Le fichier {event.dest_path} a été déplacé.")

if __name__ == "__main__":
    telecharger_fichier()

    event_handler = SurveillanceHandler()
    observer = Observer()
    observer.schedule(event_handler, path=local_directory, recursive=False)
    observer.start()
    print("Surveillance du fichier en cours...")

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

