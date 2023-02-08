#!/usr/bin/python3
"""
Requests https://jsonplaceholder.typicode.com/ for information
about employee TODO progress
"""

import requests
import sys

if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"
    employee_id = sys.argv[1]

    user_response = requests.get(f"{url}/users/{employee_id}")
    response = requests.get(f"{url}/users/{employee_id}/todos")

    name = user_response.json()["name"]
    comp_tasks = [task for task in response.json() if task["completed"]]
    tasks = len(response.json())

    print(f"Employee {name} is done with tasks({len(comp_tasks)}/{tasks}):")
    for task in comp_tasks:
        print(f"\t {task['title']}")
