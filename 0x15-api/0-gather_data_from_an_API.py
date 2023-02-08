#!/usr/bin/python3
"""
This script displays user's TODO list using {JSON} placeholder REST API
"""


def get_employee_todo():
    """
    Returns information about TODO list progress of given employee ID
    using a REST API
    """
    import requests
    import sys

    employee_id = sys.argv[1]
    user_response = requests.get("https://jsonplaceholder.typicode.com/users/{}".format(employee_id))
    response = requests.get("https://jsonplaceholder.typicode.com/users/{}/todos".format(employee_id))

    name = user_response.json()["name"]
    comp_tasks = [task for task in response.json() if task["completed"]]
    tasks = len(response.json())

    print("Employee {} is done with tasks({}/{}):".format(name, len(comp_tasks), tasks))
    for task in comp_tasks:
        print("\t {}".format(task['title']))


if __name__ == "__main__":
    get_employee_todo()
