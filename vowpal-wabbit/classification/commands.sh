#!/bin/bash

# Write out the sample data
cat >binary.dat << EOF
1 ex1[1]| a
-1 ex2[0]| a b
1 ex3[1]| c d e
-1 ex4[0]| b a
1 ex5[1]| f g
EOF
cat binary.dat
read

##############################################
# User linear regressor as a binary classifier
echo "Learn the model using linear regressor"
CMD="vw --final_regressor binary.model -d binary.dat --readable_model readable.model"
echo ${CMD};${CMD};read

echo "Do predictions(linear regressor)"
CMD="vw --quiet -t -i binary.model binary.dat -p binary.predict"
echo ${CMD};${CMD};read

echo "Seeing final predictions(linear regressor)"
cat binary.predict
echo ${CMD};${CMD};read

##############################################
# User logistic regressor as a binary classifier
echo ${CMD};${CMD};read
echo "Learn the model using logistic regressor"
CMD="vw --final_regressor binary.model -d binary.dat --readable_model readable.model --loss_function logistic"
echo ${CMD};${CMD};read

echo "Do predictions(logistic regressor)"
CMD="vw --quiet -t -i binary.model binary.dat -p binary.predict --link logistic"
echo ${CMD};${CMD};read

echo "Seeing final predictions(linear regressor)"
cat binary.predict
echo ${CMD};${CMD};read

##############################################
# User hinge loss regressor as a binary classifier
echo "Learn the model using hinge loss"
CMD="vw --final_regressor binary.model -d binary.dat --readable_model readable.model --loss_function hinge"
echo ${CMD};${CMD};read

echo "Do predictions(hinge loss)"
CMD="vw --quiet -t -i binary.model binary.dat -p binary.predict"
echo ${CMD};${CMD};read

echo "Seeing final predictions(hinge loss)"
cat binary.predict
echo ${CMD};${CMD};read

##############################################
# Report binary loss
echo "Learn the model using hinge but report binary loss"
CMD="vw --final_regressor binary.model -d binary.dat --readable_model readable.model --loss_function hinge --binary"
echo ${CMD}
${CMD}
echo ${CMD};${CMD};read

echo "Do predictions(binary loss)"
CMD="vw --quiet -t -i binary.model binary.dat -p binary.predict --binary --invert_hash readable.model"
echo ${CMD};${CMD};read

echo "Seeing final predictions(linear regressor)"
cat binary.predict readable.model
echo ${CMD};${CMD};read

