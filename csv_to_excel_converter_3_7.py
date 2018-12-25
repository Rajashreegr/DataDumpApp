import os
import glob
import csv
import time

import sys
import importlib

importlib.reload(sys)

from io import open
from xlsxwriter.workbook import Workbook
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('input_dir', type=str, help='Please enter Input directory')
args = parser.parse_args()

print ("input_dir:" + args.input_dir)

timestr = time.strftime("%Y%m%d-%H%M%S")
common_workbook = Workbook(args.input_dir+'/output_'+timestr+'.xlsx')

for csvfile in glob.glob(os.path.join(args.input_dir, '*.csv')):
    print ("File:" + csvfile)

    worksheet = common_workbook.add_worksheet(csvfile[csvfile.rfind('/')+1:csvfile.rfind('.')])

    with open(csvfile, 'rt', encoding='utf8') as f:
        reader = csv.reader(f, delimiter='|')
        for r, row in enumerate(reader):
            for c, col in enumerate(row):
                worksheet.write(r, c, col)

common_workbook.close()

print ("CSV - Excel conversion is completed.")
