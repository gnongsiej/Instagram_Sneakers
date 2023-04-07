import os
import time

from superuser.menu import show_menu
from superuser.static_ui.colors import *
# from superuser.orchestrator import run_automated_process


def redirect():
    time_in_sec = 3
    for x in range(time_in_sec):
        print(f"\t{Y}REDIRECTING...{W} --> {x + 1}{B}secs{W}", end="\r")
        time.sleep(1)

    print("\n\n")
    input("Enter any key to continue....")
    os.system("cls")

    show_menu()
    # run_automated_process()
    