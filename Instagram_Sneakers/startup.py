import os

from superuser.login import login
from superuser.screen_manager import redirect
from superuser.static_ui.colors import *


def start_sneaking():
    os.system("cls")

    login()
    redirect()


start_sneaking()
