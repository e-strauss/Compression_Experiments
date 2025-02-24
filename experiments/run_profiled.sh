source parameters.sh
logstart="results_algorithms"
x='kmeans+'
folder="census"
seed=3333
d="census_enc"
#y="claWorkloadb1"
y="claWorkloadInter"
#y="cla16"
#y="ula.xml"
fullLogname="$logstart/$x/$d/$y-singlenode.log"
mkdir -p "$(dirname "$fullLogname")"
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
  "data/$folder/test_${folder}_labels.data" \
  > $fullLogname 2>&1 &

while true; do
    # Check for the line containing "INFO api.DMLScript: Process id:"
    pid_line=$(grep "INFO api.DMLScript: Process id:" "$fullLogname")

    if [[ ! -z "$pid_line" ]]; then
        # Extract the process ID (assuming it's the last word in the line)
        pid=$(echo "$pid_line" | awk '{print $NF}')

        echo "Process ID found: $pid"

        # Pass the PID to your Java profiler (replace with actual command)
        asprof -d 30 -f flamegraph.html "$pid"

        break  # Exit the loop once the PID is found
    fi

    sleep 0.01  # Wait for 10ms before checking again
done
# -explain \
