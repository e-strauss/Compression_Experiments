#!/bin/bash


# Get the hostname of the current machine
HOSTNAME=$(hostname)
# Set SYSTEMDS_STANDALONE_OPTS based on the hostname
if [[ "$HOSTNAME" == dams-so* ]]; then
    export SYSTEMDS_STANDALONE_OPTS="-Xmx180g -Xms180g -Xmn18g"
    echo "Node detected: Setting SYSTEMDS_STANDALONE_OPTS for node"
    export SYSTEMDS_ROOT="$HOME/github/systemds"
    export PATH="$SYSTEMDS_ROOT/bin:$PATH"
elif [[ "$HOSTNAME" == "elias-ThinkPad-L15-Gen-3" ]]; then
    export SYSTEMDS_STANDALONE_OPTS="-Xmx40g -Xms40g -Xmn4000m"
    echo "Local ThinkPad detected: Setting SYSTEMDS_STANDALONE_OPTS for local"
elif [[ "$HOSTNAME" == "Mac-mini.fritz.box" || "$HOSTNAME" == "Mac-mini.local" ]]; then
    export SYSTEMDS_STANDALONE_OPTS="-Xmx10g -Xms10g -Xmn1000m"
    echo "Local Mac detected: Setting SYSTEMDS_STANDALONE_OPTS for local"
else
    echo "Hostname $HOSTNAME not recognized. Please configure SYSTEMDS_STANDALONE_OPTS manually."
fi

export LOG4JPROP='code/conf/log4j-compression.properties'
