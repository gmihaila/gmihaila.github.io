#!/bin/sh
file_name="marp"
source_file="marp-cli-v0.23.3-mac.tar.gz"
if [ -e $file_name ]; then
    echo 'File already exists'
else
    curl -Lo $source_file "https://github.com/marp-team/marp-cli/releases/download/v0.23.3/marp-cli-v0.23.3-mac.tar.gz"
    echo 'Downloaded file '$source_file
    gunzip marp-cli-v0.23.3-mac.tar.gz
    tar -xvf marp-cli-v0.23.3-mac.tar
    rm marp-cli-v0.23.3-mac.tar
    echo 'Installed Marp!'
fi