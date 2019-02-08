#!/usr/bin/env bash

set -e
echo "" > coverage.txt

for d in $(go list ./...); do
    go test -timeout 120s -race -coverprofile=profile.out -covermode=atomic $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done
