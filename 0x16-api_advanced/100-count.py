#!/usr/bin/python3
'''
Recursive function that queries Reddit API
'''
import requests


def count_words(subreddit, word_list, count=0, after=''):
    '''
    Function that queries, aprses the title of all hot articles,
    and prints a sorted count of a given keyword
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
