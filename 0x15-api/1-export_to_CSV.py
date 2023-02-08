#!/usr/bin/python3
"""
    Python script that exports data in CSV format
"""
import requests
from sys import argv


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"
    employee_id = argv[1]

    user_response = requests.get("{}/users/{}".format(url, employee_id))
    response = requests.get("{}/users/{}/todos".format(url, employee_id))

    user_name = user_response.json()["username"]
    tasks = [task for task in response.json()]

    with open('{}.csv'.format(employee_id), 'w') as f:
        for task in tasks:
            completed = task['completed']
            title = task['title']
            f.write(
                '"{}","{}","{}","{}"\n'
                .format(employee_id, user_name, completed, title)
            )
