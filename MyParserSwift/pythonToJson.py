#!/usr/bin/python
# -*- coding: UTF-8 -*-
import sys, json, stat
import os

readFile = "/Users/lishihang/Desktop/Python_test/FilePy/old.txt"

#def readFileWithData(data):
#        with open(data,'r') as obj:
#                read = obj.read()
#                writeFileWithData(read)

def writeFileWithData(data,path):
        string = data.split('?')[1]
        arr = string.split('&')
        listArr = []
        dic = {}
        for value in arr:
                keyValues = value.split('=')

                dic[keyValues[0]] = keyValues[1]

        listArr.append(dic)

        jj = json.dumps(listArr, sort_keys=True, indent=4, separators=(',',': '))
        print(jj)


if __name__ == "__main__":
        writeFileWithData(sys.argv[1], sys.argv[2])
