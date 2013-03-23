import sys , getopt
import os
import csv
import glob


layout = csv.reader(open('RDJinterface.csv'), delimiter = ';')
fields, descriptions, datatypes, lengths , start = zip(*layout)
itflengthdict = dict(zip(fields, lengths))

def parseRecords(fixedFile):
    records=[]
    for lines in fixedFile.readlines():
        record = ''
        start=0
        for field in fields:
            size=int(itflengthdict[field])
            record += '%s;' % lines[start:start+size] 
            start+=size
        records.append(record)
    return records

def writeCSV(filename, fields, records):
    writer = csv.writer(open('%s.csv' % filename, "wb"), dialect='excel')
    header = [";".join(fields)]
    writer.writerow(header)
    for record in records:
        writer.writerow([record])

path = os.getcwd()
file_pattern = 'WRDKBIFP.EXTN.SOPEVT.COR.D*'
for infile in glob.glob( os.path.join(path, file_pattern) ):
    if not infile[-3:] == 'csv':
        print "current file is: " + infile
        fixedFile= file(infile, 'rb' )
        records = parseRecords(fixedFile)
        writeCSV(infile, fields, records)
