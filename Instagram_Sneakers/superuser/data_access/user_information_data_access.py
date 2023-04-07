import json

from superuser.data_access.database_connector import connect_to_database
from superuser.data_structures.Stack import Stack


def insert_user_information(user_info):
    for field in user_info:
        field_prefix = nested_field_names.get_stack_contents()
        if field_prefix is None:
            field_name = field
        else:
            field_name = f"{field_prefix}.{field}"

        value = user_info[field]

        if isinstance(value, int) or isinstance(value, str) or isinstance(value, bool) or isinstance(value, list):
            data_cursor.execute(f"exec [dbo].[AddOrUpdateMetadata] @FieldName='{field_name}',"
                                + f" @FieldValue='{json.dumps(value)}'")
            data_cursor.commit()
        elif isinstance(value, dict):
            nested_field_names.push(field)
            insert_user_information(value)
    nested_field_names.pop()


nested_field_names = Stack()
data_cursor = connect_to_database()
