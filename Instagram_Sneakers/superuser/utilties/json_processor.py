import requests


def process_json_array(json_array):
    array_to_return = []
    for item in json_array:
        new_item = convert_to_json(item)
        array_to_return.append(new_item)
    return array_to_return


def convert_to_json(user_object):
    if isinstance(user_object, int) or isinstance(user_object, str) or isinstance(user_object, bool):
        return user_object

    user_info = {}
    for field in user_object:
        if field == "biography_with_entities" or field == "hd_profile_pic_versions" \
                or field == "profile_pic_url" or field == "profile_context_links_with_user_ids" \
                or field == "external_lynx_url":
            continue

        field_val = user_object[field]
        new_field = field.replace("_", " ").title()

        if new_field == "Hd Profile Pic Url Info":
            api_url = "http://tinyurl.com/api-create.php?url=" + field_val['url']
            url = requests.get(api_url)
            field_val['url'] = url.text

        if isinstance(field_val, int) or isinstance(field_val, str) or isinstance(field_val, bool):
            user_info[new_field] = field_val
        elif isinstance(field_val, list):
            user_info[new_field] = process_json_array(field_val)
        elif isinstance(field_val, dict):
            user_info[new_field] = convert_to_json(field_val)
    return user_info
