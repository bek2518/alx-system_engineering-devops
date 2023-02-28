#!/usr/bin/python3
'''
Function that queries Reddit API and prints the titles of the
first 10 hot posts for a given subreddit
'''
import requests


def top_ten(subreddit):
    '''
    Function that uses requests to query to Reddit API to get
    titles of first 10 hot posts in a given subreddit
    '''
    response = requests.get('https://www.reddit.com/r/{}/hot/.json'
                            .format(subreddit),
                            headers={'User-Agent': 'my_user_agent/1.0.0'},
                            params={"limit": 10})
    if response.status_code == 404:
        print("None")
        return
    posts = response.json().get("data")
    for hot_posts in posts.get("children"):
        print(hot_posts.get("data").get("title"))
