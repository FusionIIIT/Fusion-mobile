#!/bin/bash

#branches=("ac-1" "ac-2" "ac-3" "ac-4" "ac-5" "ps-1" "ps-2" "gad-1" "gad-2" "gad-3" "gad-4" "gad-5" "hr" "sa-1" "sa-2" "sa-3" "sa-4" "os-1" "os-2" "os-3" "os-4" "rspc")
branches=("ac")
for branch in "${branches[@]}"
do
    echo "Creating $branch"

    git checkout -b "$branch"
    git push origin "$branch"

    echo "Pushed new branch $branch to remote"
done