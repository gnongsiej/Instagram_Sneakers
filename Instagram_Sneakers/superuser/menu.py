import sys

from superuser.static_ui.colors import *
from superuser.static_ui.formatting import *
from superuser.login import get_client_api
from superuser.users.user_followers import fetch_user_followers
from superuser.users.user_following import fetch_user_following
from superuser.users.user_information import fetch_user_information


def show_user_login_status():
    client_api = get_client_api()
    user_id = client_api.authenticated_user_id
    user_info = client_api.user_info(user_id)

    username = user_info['user']['username']
    fullname = user_info['user']['full_name']
    user_pk = user_info['user']['pk']

    print(f"{HLINE} [ LOGGED IN SUCCESSFULLY ] {HLINE}")
    print(f"{Y}[*]{W} Username : {B}{username}{W}")
    print(f"{Y}[*]{W} Full Name : {LB}{fullname}{W}")
    print(f"{Y}[*]{W} User ID : {B}{user_pk}{W}")
    print(f"{HLINE}{HLINE}{HLINE}")


def show_menu():
    # show_user_login_status()

    print(f"""
    [ {Y}01{W} ] {R}-->{W} {B}Fetch User Information{W}
    [ {Y}02{W} ] {R}-->{W} {B}Fetch User Followers{W}
    [ {Y}03{W} ] {R}-->{W} {B}Fetch User Following{W}
    """)

    try:
        choice = int(input(f"{R}[!]{W} CHOOSE AN OPTION : ").strip())
    except Exception as e:
        print(f'[ {R}UNEXPECTED EXCEPTION{W} ] : {e}\n')
        sys.exit()

    print("\n")
    if choice == 1:
        fetch_user_information()
    elif choice == 2:
        fetch_user_followers()
    elif choice == 3:
        fetch_user_following()
    else:
        print(f'[ {R}CHOICE NOT RECOGNIZED{W} ]\n')
        sys.exit()
