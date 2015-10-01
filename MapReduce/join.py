# contact @Dai, lidai.tiger@gmail.com
# Coursera Data Science Project, Map/Reduc

import MapReduce
import sys

mr = MapReduce.MapReduce()

def mapper(record):
  order_id = record[1]
  mr.emit_intermediate(order_id, record)

def reducer(key, list_of_values):
  for first_list in list_of_values:
    for second_list in list_of_values:
      if first_list[0]=='order' and second_list[0]=='line_item':
        mr.emit(first_list + second_list)

if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  #inputdata = open("records.json")
  mr.execute(inputdata, mapper, reducer)
