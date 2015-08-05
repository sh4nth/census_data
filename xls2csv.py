import xlrd
import csv
import sys

# xls to csv converter
# ====================
#
# Usage: python xls2csv.py <filename.xls> <newname.csv>
#

ExcelFile=sys.argv[1]
CSVFile=sys.argv[2]
workbook = xlrd.open_workbook(ExcelFile)
worksheet = workbook.sheet_by_index(0)
csvfile = open(CSVFile, 'wb')
wr = csv.writer(csvfile, quoting=csv.QUOTE_ALL)

for rownum in xrange(worksheet.nrows):
    wr.writerow(worksheet.row_values(rownum))

csvfile.close()
