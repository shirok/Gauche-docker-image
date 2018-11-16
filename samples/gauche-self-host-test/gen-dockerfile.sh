#!/bin/bash

VERSION=$1

pakcages=
for testfile in `awk '/^\. \/scripts\/.*/ {print $2}' scripts/self-host-test`
do
    packages="$packages `awk '/^#packages:/,/^#end:/ {print $2}' ./$testfile`"
done

echo $packages

rm -f Dockerfile
cat > Dockerfile <<EOF
FROM practicalscheme/gauche:$VERSION

RUN apt-get install -y autoconf automake `echo $packages`
EOF

cat >> Dockerfile <<EOF
ADD scripts /scripts
CMD ["/scripts/self-host-test"]
EOF
