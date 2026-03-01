#!/bin/bash

# part 1:
for FILE in test_*.act; do 
  echo $FILE; 
  aflat -Tsky130l $FILE > prs/$FILE.prs
done

set -euo pipefail

run_one () {
  local actfile="$1"
  local proc="$2"
  local scr="$3"

  echo "=================================================="
  echo "Running: $actfile  process: $proc  script: $scr"
  echo "=================================================="

  actsim "$actfile" "$proc" <<EOC
source ./$scr
quit
EOC
}

# run each test
run_one test_inv.act   inv   test_inv.scr
run_one test_nand2.act nand2 test_nand2.scr
run_one test_nor2.act  nor2  test_nor2.scr
run_one test_celem2.act  inv_c  test_celem2.scr


# part 2, buffer:
echo "cycle
exit
" | actsim -Wlang_subst:off testbuf.act test > log/pt2_buftest.log 2>&1

# part 2, priority queue:
echo "cycle
exit
" | actsim -Wlang_subst:off testprio.act test > log/pt2_priotest.log 2>&1