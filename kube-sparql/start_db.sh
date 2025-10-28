#!/bin/bash
# sed replace env variabels

#sed "s|\${test_URL}|$test_URL|g" test.conf.template > test.conf
#cp -r /fuseki/databases/biofid-search /fuseki/databases/biofid-search-2

./entrypoint.sh --update --tdb2 --port 5430 --loc /fuseki/databases/biofid-search /biofid-search



#docker build -t kube-sparql -f ./kube-sparql/Dockerfile .
#  docker run -p 16543:5430 --name uce-kube-sparql --network uce-test-network  -v ../test_data/biofid-search:/fuseki/databases/biofid-search kube-sparql
