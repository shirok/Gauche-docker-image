#!/bin/bash
# Run the gosh command in docker with the current directory and below
# being visible to it.
docker run -v `pwd`:/home/app --rm -ti practicalscheme/gauche /usr/bin/gosh-script "$@"
