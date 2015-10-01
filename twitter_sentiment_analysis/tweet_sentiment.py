# Contact me @ lidai.tiger at gmail dot com
# Coursera-Data science Assignment 1

# Usage:
# $ python tweet_sentiment.py <sentiment library> <tweets file>

import sys
import json
import re

def main():

    # load dictionary of sentiments with scores

    #sent_dict = open("AFINN-111.txt")
    sent_dict = open(sys.argv[1])

    scores = {}
    for line in sent_dict:
        term, score = line.split('\t')
        scores[term] = float(score)

    # load tweet file
    
    #tweet_file = open("output.txt")
    tweet_file= open(sys.argv[2])

    score_output = []
    # load each tweet using json
    for line in tweet_file:
        score=0
        tweet_data = json.loads(line)
        if tweet_data.get('text'):
            tweet_text = tweet_data['text'].encode('utf8').split(' ')
            for word in tweet_text:
                 if re.match("^[A-Za-z0-9_-]*$", word):
                    score += scores.get(word,0)
        score_output.append(score)

    for i in score_output:
	    print "%.2f" % i

    
if __name__ == '__main__':
  main()

                    
                
            
     
     

    
    

