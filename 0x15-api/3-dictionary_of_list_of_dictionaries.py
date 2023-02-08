#!/usr/bin/python3
"""
    Python script that exports data in JSON format
"""
import json
import requests
from sys import argv


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"

    user_response = requests.get("{}/users/".format(url)).json()

    with open("todo_all_employees.json", "w") as f:
        json.dump({user.get("id"): [{
            "username": user.get("username"),
            "task": task.get("title"),
            "completed": task.get("completed")}
            for task in requests.get("{}/users/{}/todos".
                                     format(url, user.get("id"))).json()]
            for user in user_response}, f)
