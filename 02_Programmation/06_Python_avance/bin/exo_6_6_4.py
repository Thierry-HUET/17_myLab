import tkinter as tk


def afficher_message():
    prenom = entree.get()
    message.config(text=f"Bienvenue, {prenom} !")


fenetre = tk.Tk()
fenetre.title("Bienvenue")

label_instruction = tk.Label(fenetre, text="Entrez votre prénom :")
label_instruction.pack()

entree = tk.Entry(fenetre)
entree.pack()

bouton = tk.Button(fenetre, text="Valider", command=afficher_message)
bouton.pack()

message = tk.Label(fenetre, text="")
message.pack()

fenetre.mainloop()
