from superuser.login import client_api
from superuser.static_ui.colors import *
from superuser.static_ui.formatting import *
from superuser.users.user_followers import fetch_user_followers
from superuser.users.user_following import fetch_user_following
from superuser.users.user_information import fetch_user_information


def show_user_login_status():
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


def run_automated_process():
    fetch_user_information()
    fetch_user_followers()
    fetch_user_following()

    # Call data processing methods
    pass
