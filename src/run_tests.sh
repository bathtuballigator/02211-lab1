#!/bin/bash

# part 1:
for FILE in test_*.act; do 
  echo $FILE; 
  aflat -Tsky130l $FILE > $FILE.prs
done

# part 2, buffer:
echo "cycle
exit
" | actsim -Wlang_subst:off testbuf.act test > pt2_buftest.log

# pseudocode:
#   source:
#     if recieving data + push, send data to buf[0]. when buf[0] is full and can't push next element down, send will stall
#   sink:
#     if getting pop signal, remove data from buf[0] and enable empty indicator
#
#   buffer element:
#   loop:
#     attempt send data up (if first buffer, will try and send to sink)
#     OR
#     wait for data on input
#
#
#     if input > current value,
#       send input to next buffer (will wait for ack)
#     else,
#       send current value to next buffer (will wait for ack)
#       set input to current value

