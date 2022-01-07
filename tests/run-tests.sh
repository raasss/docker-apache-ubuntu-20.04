#!/usr/bin/env bash

set -u

cd "$(dirname $0)"

RED='\033[0;31m' # red collor
GREEN='\033[0;32m' # green collor
NC='\033[0m' # no Color


for TESTDIR in $(ls -d test*); do
    cd $TESTDIR
    cp -f ../../Dockerfile .
    cp -f ../../000-default.conf .
    cp -f ../../docker-entrypoint.sh .
    cp -f ../../Dockerfile .
    cp -f ../../servername.conf .

    docker-compose build &>/dev/null
    docker-compose up -d &>/dev/null
    DOCKER_HOST_URL="http://$(docker-compose port apache 80)"
    for TESTFILE in $(ls -1 test_*.sh); do
        echo -n ">>> ${TESTDIR}/${TESTFILE} ... "
        source ${TESTFILE}
        if [ "$?" == 0 ]
        then
            echo -e "${GREEN}PASS${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    done
    # # Clean test environment
    docker-compose stop &>/dev/null
    docker-compose down &>/dev/null
    cd ..
done