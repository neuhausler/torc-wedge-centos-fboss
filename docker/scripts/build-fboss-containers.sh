#/bin/bash

cd ../backdoor-builder
docker build -t backdoor-builder .

cd ../fboss/provision
docker run -v $PWD/bin:/target backdoor-builder

tar -zxvf /tmp/fboss.tar.gz
mv wedge_agent ./bin
cd ..
docker build -t fboss-2.0 .

cd ../fboss-client
docker build -t fboss-client .
