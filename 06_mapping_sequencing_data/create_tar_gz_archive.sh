#!/usr/bin/env bash

# creates a test archive file 

rm -rf directory?
rm -rf archive*
rm file?.txt

mkdir -p "directory1"
echo "apples" > ./directory1/file1.txt
echo "bananas" > ./directory1/file2.txt
echo "lions" > ./directory1/file3.txt

mkdir -p "directory2"
echo "tigers" > ./directory2/file4.txt

mkdir -p "archive"
mv directory1 archive/
mv directory2 archive/

tar --remove-files -czvf archive.tar.gz archive
