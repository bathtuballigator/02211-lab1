#!/bin/bash

# part 1:
for FILE in test_*.act; do 
  echo $FILE; 
  aflat -Tsky130l $FILE > prs/$FILE.prs
done

# part 2, buffer:
echo "cycle
exit
" | actsim -Wlang_subst:off testbuf.act test > log/pt2_buftest.log 2>&1

# part 2, priority queue:
echo "cycle
exit
" | actsim -Wlang_subst:off testprio.act test > log/pt2_priotest.log 2>&1