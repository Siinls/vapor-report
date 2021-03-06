#!/bin/bash
usage() {
    echo "[#] Usage: ./report.sh [steamID64]"
    exit 0
}

if [ -z "$1" ]; then
    usage
fi

node protos/updater.js

for user in users/*.json; do
    if [ "$user" = "users/example.json" ]; then
        continue
    fi

    node report.js $user $1
done
