# contact @Dai, lidai.tiger@gmail.com
# Coursera Course Project, Map/Reduce

import MapReduce
import sys

mr = MapReduce.MapReduce()

def mapper(record):
    key = record[0]
    value = record[1]
    mr.emit_intermediate(value[:-10],key)

def reducer(key, list_of_values):
    mr.emit(key)
    
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  #inputdata = open("dna.json")
  mr.execute(inputdata, mapper, reducer)
