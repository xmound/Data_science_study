import sys
import json

def get_tweet(tweet_file):
     for line in tweet_file:
          data = json.loads(line)
          if len(data) > 10:
              tweets.append(data["text"].replace('\n',''))
              #tweets = tweets.encode('utf-8') 
     return tweets


#tweet_file = open(sys.argv[1])
tweet_file = open("output.txt")  

tweets=[]
histogram = {}
  
get_tweet(tweet_file)
total=float(0)

for line in tweets:
     filedata = line
     words=filedata.split(' ')
     for word in words:
         histogram[word] = float(histogram.get(word,0) + 1)
         total=total+1

flist = []
for word, count in histogram.items():
    flist.append([count/total,word])
flist.sort()
flist.reverse()

for pair in flist:
     #pair[1] = str(pair[1])
     #pair[0] = float(pair[0])
     print "%s %.4f" % (pair[1].replace('\n',' '),pair[0])
