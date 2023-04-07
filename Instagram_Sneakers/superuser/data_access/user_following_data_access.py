import time

from superuser.data_access.database_connector import connect_to_database


def fetch_following_list():
    returned_list = []
    data_cursor.execute(f"exec [dbo].[FetchActiveFollowing]")
    for row in data_cursor.fetchall():
        returned_list.append(row[0])
    return returned_list


def insert_new_following(users, users_private):
    for user in users:
        data_cursor.execute(f"exec [dbo].[AddFollowing]"
                            + f"@UserName='{user}', @IsPrivate={users_private[user]}, @DateAdded=NULL")
        data_cursor.commit()
        time.sleep(1)


def remove_missing_following(users):
    for user in users:
        data_cursor.execute(f"exec [dbo].[RemoveFollowing] @UserName={user}, @DateRemoved=NULL")
        data_cursor.commit()
        time.sleep(1)


data_cursor = connect_to_database()
