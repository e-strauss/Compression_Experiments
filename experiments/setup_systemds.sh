#!/bin/bash

if [[ ! -d "$HOME/github/systemds" ]]; then
    echo "downloading SystemDS"
    cd "$HOME/github"
    git clone git@github.com:apache/systemds.git
fi

cd ~/github/systemds
git fetch
#systemDSID=
#git checkout "c6195020bf19c9e50f091cfc120bd2ec1805c00e"
git checkout -b compress_experiments origin/compress_experiments
mvn clean package
export SYSTEMDS_ROOT="$HOME/github/systemds"
