import logging
import sys

from superuser.cookies import reset_cookies, print_cookie_info

from instagram_private_api import (
    Client,
    ClientError,
    ClientLoginError,
    ClientCookieExpiredError,
    ClientLoginRequiredError
)

from superuser.static_ui.colors import *

logger = None
client_api = None


def setup():
    global logger
    logging.basicConfig()
    logger = logging.getLogger("Instagram_Sneakers.LoginModule")
    logger.setLevel(logging.WARNING)


def perform_login():
    global client_api
    try:
        username = 'user.name'
        password = 'password'

        client_api = Client(username, password)
    except (ClientCookieExpiredError, ClientLoginRequiredError) as e:
        print(f'[ {R}COOKIES EXPIRED RE-LOGIN{W} ] : {e}\n')
        reset_cookies()
        sys.exit()
    except ClientLoginError as e:
        print(f'[ {R}CLIENT LOGIN ERROR{W} ] : {e}\n')
        reset_cookies()
        sys.exit()
    except ClientError as e:
        print(f'[ {R}CLIENT ERROR{W} ] : {e.msg}\n[ {R}CODE{W} ] : {e.code}\n[ {R}RESPONSE{W} ] : {e.error_response}\n')
        sys.exit()
    except Exception as e:
        print(f'[ {R}UNEXPECTED EXCEPTION{W} ] : {e}\n')
        sys.exit()
    except KeyboardInterrupt:
        sys.exit()

    return client_api


def print_login_success():
    user_id = client_api.authenticated_user_id
    user_info = client_api.user_info(user_id)

    print(f'{G}LOGGED IN SUCCESSFULLY AS{W} : {user_info["user"]["username"]}')


def get_client_api():
    return client_api


def login():
    global client_api
    setup()
    client_api = perform_login()
    print_cookie_info(client_api)
    print_login_success()
