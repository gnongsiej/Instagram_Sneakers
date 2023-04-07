import datetime
import json
import os

from superuser.static_ui.colors import *


def reset_cookies():
    os.system("rm -rf superuser/cookies/cookies.txt")
    modify_json = {"loggedBefore": False}
    with open("superuser/cookies/previous_cookie.json", "w") as outfile:
        json.dump(modify_json, outfile)


def print_cookie_info(client_api):
    cookie_expiry = client_api.cookie_jar.auth_expires

    print(f"[ {G}COOKIE EXPIRY{W} ] : ",
          f"{datetime.datetime.fromtimestamp(cookie_expiry).strftime('%Y-%m-%dT%H:%M:%SZ')}\n")
