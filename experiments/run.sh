source parameters.sh
logstart="results_algorithms/"
x='kmeans+'
folder="census"
seed=3333
d="census_enc_16k"
y="ulab16"
fullLogname="$logstart/$x/$d/$y-singlenode.log"
#perf stat -d -d -d \
systemds \
code/algorithms/$x.dml \
-config code/conf/$y.xml \
-stats 100 -debug \
-exec singlenode \
-seed $seed \
-args "data/$folder/train_$d.data" \
1 \
"results/algorithms/$x/$d/$y.csv" \
"data/$folder/train_${d}_labels.data" \
"data/$folder/test_${folder}.data" \
"data/$folder/test_${folder}_labels.data"
>>$fullLogname 2>&1
# -explain \