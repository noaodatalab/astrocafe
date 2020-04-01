#!/usr/bin/env bash

#########################################################
# Build Docker image using 'image' and 'tag' from .config
#########################################################

version='20200401'
author='Robert Nikutta & Data Lab Team <nikutta@noao.edu>'

# Set CWD to the location of this script
cd "$(dirname "$0")"

# Source the config file
. .config

# Process cmd line args
function usage {
  echo "Usage:"
  echo "      $(basename $0) [options...]"
  echo ""
  echo "Options:"
  echo "   [-h|-?|--help]        Display a usage summary"
  echo "   [-p|--push]           Push image to Docker Hub"
  exit
}

version=''
do_push=0

declare -a userargs skiplist
while [ "$#" -gt 0 ]; do
    case $1 in
        -h|-\?|--help) usage;;
        -p|--push) export do_push=1;;
        *) userargs=("${userargs[@]}" "${1}");;
    esac; shift
done

# build Docker image
echo "Building Docker image $image:$tag ..."
#docker build -t $image:$tag .

# push image to Docker Hub
if [ $do_push == 1 ]; then
    echo "Pushing image to Docker Hub..."
    #docker push ...
fi
    
echo "Done."