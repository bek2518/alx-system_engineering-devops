#!/usr/bin/python3
'''
Function that queries Reddit API and return the number of subscribers
'''
import requests


def number_of_subscribers(subreddit):
    '''
    Function that uses requests to query to Reddit API to get total subscribers
    '''
    response = requests.get('https://www.reddit.com/r/{}/about.json'
                            .format(subreddit),
                            headers={'User-Agent': 'my_user_agent/1.0.0'})
    if response.status_code == 404:
        return (0)
    subscribers = response.json().get("data").get("subscribers")
    return (subscribers)
