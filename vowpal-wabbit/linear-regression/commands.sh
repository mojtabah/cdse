#!/bin/bash

# Write out the sample data
cat >regression.dat << EOF
1 ex1_[1]| a
0.6 ex2_[0.6]| a b
-0.6 ex3_[-0.6]| x y
-1 ex4_[-1]| y z
0 ex5_[0]| c
EOF
cat regression.dat
read

echo "Learn the model using linear regressor"
CMD="vw --final_regressor regression.model -d regression.dat --readable_model readable.model"
echo ${CMD};${CMD};read

echo "Do predictions"
CMD="vw --quiet -t -i regression.model regression.dat -p regression.predict"
echo ${CMD};${CMD};read

echo "Seeing final predictions"
cat regression.predict
echo ${CMD};${CMD};read

echo "Learn the model using multiple passes"
echo ${CMD};${CMD};read
CMD="vw --final_regressor regression.model -d regression.dat --readable_model readable.model --passes 100 -k --holdout_off -c"
echo ${CMD};${CMD};read

echo "Do predictions"
CMD="vw --quiet -t -i regression.model regression.dat -p regression.predict"
echo ${CMD};${CMD};read

echo "Seeing final predictions"
cat regression.predict
echo ${CMD};${CMD};read

############################################################
# Quantile prediction
echo "Doing median prediction instead of quantile prediction"
echo ${CMD};${CMD};read

echo "Learn the model using multiple passes"
CMD="vw --final_regressor regression.model -d regression.dat --readable_model readable.model --passes 100 -k --holdout_off -c --loss_function quantile"
echo ${CMD};${CMD};read

echo "Do predictions"
CMD="vw --quiet -t -i regression.model regression.dat -p regression.predict"
echo ${CMD};${CMD};read

echo "Seeing final predictions"
cat regression.predict
echo ${CMD};${CMD};read


