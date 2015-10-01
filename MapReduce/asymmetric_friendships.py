# Contact @Dai, lidai.tiger@gmail.com
# Coursera Data Science Project, Map/Reduce

import sys
import MapReduce

mr = MapReduce.MapReduce()

def mapper(record):
    #two direction
    mr.emit_intermediate(record[0],record[1])
    mr.emit_intermediate(record[1],record[0])

def reducer(key, list_of_values):
    friends = {}
    for value in list_of_values:
        if value in friends:
            del friends[value]
        else:
            friends[value] = 'one pair'
    for friend in friends:
        mr.emit((key,friend))

if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  #inputdata = open("friends.json")
  mr.execute(inputdata, mapper, reducer)
