#!/bin/bash
# sed replace env variabels

#sed "s|\${test_URL}|$test_URL|g" test.conf.template > test.conf
#cp -r /fuseki/databases/biofid-search /fuseki/databases/biofid-search-2

./entrypoint.sh --update --tdb2 --port 5430 --loc /fuseki/databases/biofid-search /biofid-search
