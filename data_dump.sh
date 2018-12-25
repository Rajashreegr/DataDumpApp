#!/bin/bash

#Clear the results directory
rm ./results/*

#Script to write the queries with same header data to csv file.
sh data_dump_to_same_csv_file.sh

#Script to write the queries with different header data to csv file.
sh data_dump_to_diff_csv_file.sh

#Script to convert csv file to Excel file. Replace correct version of python path
/lcms_common/anaconda/python/PREPRD/2.7.12/bin/python csv_to_excel_converter_2_7.py ./results

