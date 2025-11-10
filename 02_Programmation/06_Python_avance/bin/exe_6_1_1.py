"""
Exemples pour la conventions de nommage
"""

def ma_fonction(param1: int | float, param2: int | float) -> int | float:
    """
    Cette fonction prend deux paramètres et retourne leur somme.

    :param param1: Premier paramètre de la fonction
    :param param2: Deuxième paramètre de la fonction
    :return: La somme de param1 et param2
    """
    return param1 + param2


class MaClasse:
    """
    Une classe exemple pour démontrer les conventions de nommage et la documentation.

    Attributes:
        attribut_public (int): Un attribut public de la classe.
        __attribut_prive (int): Un attribut privé de la classe.
    """

    _variable_interne = (
        42  # Variable interne, non destinée à être utilisée en dehors de ce contexte
    )
    __attribut_prive = 42  # Variable privée avec "name mangling"

    def __init__(self) -> None:
        self.attribut_public = 10
        self.__attribut_prive = 20
