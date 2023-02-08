#!/usr/bin/python3
'''
Python script that for a given employee ID returns information
about his/her TODO list progress
'''
import requests
from sys import argv


def get_employee_todo_progress(employee_id=argv[1]):
    '''
    Function that requests to the jsonplaceholder.typicode.com website
    Displays the todo list based on the employee id given 
    '''
    url = "https://jsonplaceholder.typicode.com"
    user_response = requests.get(f"{url}/users/{employee_id}")
    response = requests.get(f"{url}/users/{employee_id}/todos")

    name = user_response.json()["name"]
    comp_tasks = [task for task in response.json() if task["completed"]]
    tasks = len(response.json())

    print(f"Employee {name} is done with tasks({len(comp_tasks)}/{tasks}):")
    for task in comp_tasks:
        print(f"\t {task['title']}")


if __name__ == "__main__":
    get_employee_todo_progress()
