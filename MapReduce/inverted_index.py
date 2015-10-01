# contact @Dai, lidai.tiger@gmail.com
# Coursera Course Project, Map/Reduce

import MapReduce
import sys

mr = MapReduce.MapReduce()

def mapper(record):
    # key: document identifier
    # value: document contents
    # appearance: to make sure each word,book pair is counted only once
    key = record[0]
    value = record[1]
    words = value.split()
    appearance = []
    for w in words:
      if w not in appearance:
        appearance.append(w)
        mr.emit_intermediate(w, key)

def reducer(key, list_of_values):
    # key: word
    # value: list of occurrence document names
    mr.emit((key, list_of_values))

if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  # inputdata = open("books.json")
  mr.execute(inputdata, mapper, reducer)
