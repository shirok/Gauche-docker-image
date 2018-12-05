#!/bin/bash

VERSION=$1

echo $packages

rm -f Dockerfile
cat > Dockerfile <<EOF
FROM practicalscheme/gauche:$VERSION
RUN apt-get update
RUN apt-get install -y autoconf automake sudo
EOF

for testfile in `awk '/^\. \/scripts\/.*/ {print $2}' scripts/self-host-test`
do
    packages="`awk '/^#packages:/,/^#end:/ {print $2}' ./$testfile`"
    echo "RUN apt-get install -y `echo $packages`" >> Dockerfile
done


cat >> Dockerfile <<EOF
ADD scripts /scripts
CMD ["/scripts/self-host-test"]
EOF
