#!/bin/bash


# Get the hostname of the current machine
HOSTNAME=$(hostname)
# Set SYSTEMDS_STANDALONE_OPTS based on the hostname
if [[ "$HOSTNAME" == "dams-so003" ]]; then
    export SYSTEMDS_STANDALONE_OPTS="-Xmx180g -Xms180g -Xmn18g"
    echo "Node detected: Setting SYSTEMDS_STANDALONE_OPTS for node"
    export SYSTEMDS_ROOT="$HOME/github/systemds"
    export PATH="$SYSTEMDS_ROOT/bin:$PATH"
elif [[ "$HOSTNAME" == "elias-ThinkPad-L15-Gen-3" || "$HOSTNAME" == "Mac-mini.fritz.box" || "$HOSTNAME" == "Mac-mini.local" ]]; then
    export SYSTEMDS_STANDALONE_OPTS="-Xmx10g -Xms10g -Xmn1000m"
    echo "Local detected: Setting SYSTEMDS_STANDALONE_OPTS for local"
else
    echo "Hostname $HOSTNAME not recognized. Please configure SYSTEMDS_STANDALONE_OPTS manually."
fi
