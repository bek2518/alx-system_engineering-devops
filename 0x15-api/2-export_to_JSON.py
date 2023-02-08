#!/usr/bin/python3
"""
    Python script that exports data in JSON format
"""
import json
import requests
from sys import argv


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"
    employee_id = argv[1]

    user_response = requests.get(f"{url}/users/{employee_id}").json()
    response = requests.get(f"{url}/users/{employee_id}/todos").json()

    with open("{}.json".format(employee_id), "w") as f:
        json.dump({employee_id: [{
            "task": task.get("title"),
            "completed": task.get("completed"),
            "username": user_response.get("username")} for task in response]},
            f)
