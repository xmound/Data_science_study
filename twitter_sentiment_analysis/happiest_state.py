# Contact me @ lidai.tiger at gmail dot com
# Coursera-Data science Assignment 1

# Usage:
# $ python happiest_state.py <sentiment library> <tweets file>

import sys
import json
import re

def main():

  # load dictionary of sentiments with scores
  
  #sent_dict = open("AFINN-111.txt") 
  sent_dict = open(sys.argv[1])
  scores = {}
  for line in sent_dict:
    term, score  = line.split("\t")
    scores[term] = int(score)

  initial_state_sentiment = {}

  # load each tweet as json
  
  #tweet_file = open("output_large.txt")
  tweet_file= open(sys.argv[2])
  for line in tweet_file:
    score = 0
    tweet_data = json.loads(line)
    
    # if a tweet is sent from the US and has text ...
    if tweet_data.get('place') and tweet_data['place']['country_code'] == 'US' and tweet_data.get('text'):
      location = tweet_data['place']['full_name'].encode('utf8').split(', ')
      if location[1] != 'US':
        tweet_text = tweet_data['text'].encode('utf8').split()
        for word in tweet_text:
          # only read alphanumeric words (NEED TO LOWERCASE?)
          if re.match("^[A-Za-z0-9_-]*$", word):
            score += scores.get(word, 0)
        initial_state_sentiment.setdefault(location[1], []).append(score)

  state_sentiment = {}

  for key, value in initial_state_sentiment.items():
    average = sum(value) / len(value)
    state_sentiment[key] = average

  # print the two letter state abbreviation to stdout
  #print state_sentiment
  print max(state_sentiment, key=state_sentiment.get)

if __name__ == '__main__':
  main()
