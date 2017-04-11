#!/bin/bash
echo "Entering data"
cat > train.vw <<EOF
-1 example0| a b c
1 example1| x y z
EOF
read
cat train.vw 

echo "Training vowpal wabbit"
vw -k -c --passes 20 --holdout_off train.vw -f model.vw

echo "Answering requests on port 26542"
vw -i model.vw  -t --daemon --quiet --port 26542 &

echo "Checking for daemon processes"
pgrep vw| wc -l
