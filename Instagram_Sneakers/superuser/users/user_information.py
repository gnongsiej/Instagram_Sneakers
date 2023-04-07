import json
import sys

from instagram_private_api import ClientError

from superuser.login import get_client_api
from superuser.static_ui.colors import *
from superuser.static_ui.formatting import *
from superuser.utilties.json_processor import convert_to_json
from superuser.data_access.user_information_data_access import insert_user_information


def fetch_user_information():
    print(f"[ {Y}ACTION{W} ] : {LB}FETCH USER INFORMATION{W}")
    print(f"{HLINE}{HLINE}{HLINE}")

    user_name = 'sneak.account'
    client_api = get_client_api()
    try:
        fetched_user_id = client_api.username_info(user_name)
    except ClientError as e:
        print(f'[ {R}ClientError{W} ] : {e.msg}\n[ {R}Code{W} ] : {e.code}\n[ {R}Response{W} ] : {e.error_response}')
        sys.exit()

    user_pk = fetched_user_id['user']['pk']
    fetched_user_info = client_api.user_info(user_pk)
    user_profile = fetched_user_info['user']

    user_info_json = convert_to_json(user_profile)
    insert_user_information(user_info_json)


# file_path = 'superuser/resources/tester.json'
# with open(file_path, 'r', encoding='utf-8') as file_handle:
#     json_content = json.load(file_handle)
#
# user_info = convert_to_json(json_content)
# insert_user_information(user_info)
