# Contact me @ lidai.tiger at gmail dot com
# Coursera-Data science Assignment 1

# Usage:
# $ python top_ten.py <tweet_file>

import sys
import json
import re
from collections import Counter

def main():
 
  #tweet_file = open("output_large.txt")
  tweet_file= open(sys.argv[1])

  hashtags=[]
    
  for line in tweet_file:
    count = 0
    tweet_data = json.loads(line)
    
    # if a tweet has a hashtag, and..
    if "entities" in tweet_data and "hashtags" in tweet_data["entities"]:
      if tweet_data['entities']['hashtags'] != []:
        for hashtag in tweet_data['entities']['hashtags']:
          tags = hashtag['text'].encode('utf-8')
          hashtags.append(tags)

  # print top 10 hash tags to stdout
  top_ten = Counter(hashtags).most_common(10)
  for key, value in top_ten:
    print key, float(value)


if __name__ == '__main__':
  main()

