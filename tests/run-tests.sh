#!/usr/bin/env bash

set -u

RED='\033[0;31m' # red collor
GREEN='\033[0;32m' # green collor
NC='\033[0m' # no Color
DOCKER_COMPOSE="docker-compose -f docker-compose.yml"

# Prepare test environment
cd ..
${DOCKER_COMPOSE} build
${DOCKER_COMPOSE} up -d
DOCKER_HOST_URL="http://$(${DOCKER_COMPOSE} port apache 80)"

# Run tests
cd tests
for T in $(find . -type f -name 'test_*.sh')
do
    echo -n ">>> Running test $T ... "
    source $T
    if [ "$?" == 0 ]
    then
        echo -e "${GREEN}PASS${NC}"
    else
        echo -e "${RED}FAIL${NC}"
    fi
done

# Clean test environment
cd ..
${DOCKER_COMPOSE} stop
${DOCKER_COMPOSE} down
