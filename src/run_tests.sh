#!/bin/bash

for FILE in test_*.act; do 
  echo $FILE; 
  aflat -Tsky130l $FILE > $FILE.prs
done

