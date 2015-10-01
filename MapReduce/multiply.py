# contact @Dai, lidai.tiger@gmail.com
# Coursera Course Project, Map/Reduce

import MapReduce
import sys

mr = MapReduce.MapReduce()

def mapper(record):
    key = record[0]
    row = record[1]
    column = record[2]
    value = record[3]
    if key == 'a':
        for k in range(5):
            mr.emit_intermediate((row,k),record)
    else:
        for i in range(5):
            mr.emit_intermediate((i,column),record)

def reducer(key, list_of_values):
    va={}
    vb={}

    for value in list_of_values:
        if value[0] == 'a':
            va[value[2]]=value[3]
        else:
            vb[value[1]]=value[3]

    result=0
    for i in range(5):
        if i in va and i in vb:
            result += va[i]*vb[i]

    n=[]
    n.append(key[0])
    n.append(key[1])
    n.append(result)
    mr.emit(tuple(n))
    
if __name__ == '__main__':
  inputdata = open(sys.argv[1])
  #inputdata = open("matrix.json")
  mr.execute(inputdata, mapper, reducer)
