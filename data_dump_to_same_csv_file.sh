#!/bin/bash

if [ $# -lt 1 ]; then
 cd "./results" 
 printf "The directory is not entered. I'm creating the files in the directory: "
 pwd
else
 cd $1
fi

write_to_file_with_header () {
    hive -e "set hive.cli.print.header=true; set hive.resultset.use.unique.column.names=false; $2" | sed 's/[\t]/|/g' > $1.csv
}

write_to_file () {
    hive -e "$2" | sed 's/[\t]/|/g' >> $1.csv
}

Query1="select * from employee where dept = 'CS'"
printf "\nQuery1: $Query1 \n"

write_to_file_with_header "Query_OP" "$Query1"

Query2="select * from employee where dept = 'EC'"
printf "\nQuery2: $Query2 \n"

write_to_file "Query_OP" "$Query2"

#ADD ADDITIONAL QUERIES HERE
#All the Queries should result in same header.
#Step 1: Add new query: Query3 = "select id, name, dept, score from employee where dept = 'IS'"
#Step 2: Invoke the method to write the data to file: write_to_file "Query_OP" "$Query3"
#Step 3: Repeat the steps 1 & 2 required number of times.

printf "Data is dumped to CSV files"
