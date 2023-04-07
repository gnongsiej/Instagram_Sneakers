import sys

from instagram_private_api import ClientError

from superuser.data_access.user_followers_data_access import *
from superuser.data_processing.users.user_list_extractor import extract_users_from_list, fetch_private_users_from_list
from superuser.login import get_client_api
from superuser.static_ui.colors import *
from superuser.static_ui.formatting import *
from superuser.utilties.comparator import find_difference_in_lists


def get_more_user_followers(client_api, user_pk, rank_token, next_max_id):
    if next_max_id == '99999':
        response = client_api.user_followers(user_pk, rank_token)
    else:
        response = client_api.user_followers(user_pk, rank_token, max_id=next_max_id)

    current_user_followers_list = response['users']
    current_user_followers_list = extract_users_from_list(current_user_followers_list)
    previous_user_followers_list = fetch_followers_list()

    users_added = find_difference_in_lists(current_user_followers_list, previous_user_followers_list)
    users_removed = find_difference_in_lists(previous_user_followers_list, current_user_followers_list)

    user_private_list = fetch_private_users_from_list()

    insert_new_followers(users_added, user_private_list)
    remove_missing_followers(users_removed)

    try:
        return response['next_max_id']
    except KeyError as e:
        print(response)
        return ''


def fetch_user_followers():
    print(f"[ {Y}ACTION{W} ] : {LB}FETCH USER FOLLOWERS{W}")
    print(f"{HLINE}{HLINE}{HLINE}")

    user_name = 'sneak.account'
    client_api = get_client_api()
    try:
        fetched_user_id = client_api.username_info(user_name)
    except ClientError as e:
        print(f'[ {R}ClientError{W} ] : {e.msg}\n[ {R}Code{W} ] : {e.code}\n[ {R}Response{W} ] : {e.error_response}')
        sys.exit()

    user_pk = fetched_user_id['user']['pk']
    rank_token = client_api.generate_uuid()

    next_max_id = '99999'
    while next_max_id != '':
        next_max_id = get_more_user_followers(client_api, user_pk, rank_token, next_max_id)
