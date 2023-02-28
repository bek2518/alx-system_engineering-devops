#!/usr/bin/python3
'''
Recursive function that queries Reddit API
'''
import requests


def recurse(subreddit, hot_list=[], count=0, after=''):
    '''
    Function that queries and returns list containing the titles
    of all hot article for a given subreddit
    '''
    response = requests.get('https://www.reddit.com/r/{}/hot/.json'
                            .format(subreddit),
                            headers={'User-Agent': 'my_user_agent/1.0.0'},
                            params={'count': count, 'after': after})
    if response.status_code == 404:
        return(None)
    posts = response.json().get("data")
    after = posts.get("after")
    count += posts.get("dist")
    for hot_posts in posts.get("children"):
        hot_list.append(hot_posts.get("data").get("title"))

    if after is not None:
        return recurse(subreddit, hot_list, count, after)
    return hot_list
