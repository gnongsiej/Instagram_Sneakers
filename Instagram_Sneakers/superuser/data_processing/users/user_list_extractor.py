from superuser.data_structures.UserPrivate import UserPrivate


def extract_users_from_list(user_list):
    for user in user_list:
        user_name = user['username']
        user_is_private = user['is_private']

        extracted_user_list.append(user_name)
        if user_is_private:
            is_private_bit = 0
        else:
            is_private_bit = 1

        user_private_list[user_name] = is_private_bit
        # user_private_item = UserPrivate()
        # user_private_item.name = user_name
        # user_private_item.is_private = is_private_bit
        # user_private_list.append(user_private_item)

    return extracted_user_list


def fetch_private_users_from_list():
    return user_private_list


extracted_user_list = []
user_private_list = {}
