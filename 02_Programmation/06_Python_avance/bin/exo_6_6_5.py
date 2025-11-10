import urwid


def on_submit(button, edit):
    name = edit.edit_text
    response.set_text(f"Bonjour, {name} !")


def on_exit(button):
    raise urwid.ExitMainLoop()


edit = urwid.Edit("Entrez votre nom : ")
submit = urwid.Button("Valider")
response = urwid.Text("")
quit_button = urwid.Button("Quitter")

urwid.connect_signal(submit, "click", on_submit, edit)
urwid.connect_signal(quit_button, "click", on_exit)

pile = urwid.Pile([edit, submit, response, quit_button])
fill = urwid.Filler(pile, valign="top")
loop = urwid.MainLoop(fill)
loop.run()
