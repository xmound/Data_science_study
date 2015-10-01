import sys
import MapReduce

mr = MapReduce.MapReduce()

def mapper(record):
    key = record[0]
    mr.emit_intermediate(key,1)

def reducer(key, list_of_values):
    mr.emit((key, sum(list_of_values)))

if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  #inputdata = open("friends.json")
  mr.execute(inputdata, mapper, reducer)
