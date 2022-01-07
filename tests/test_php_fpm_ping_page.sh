RESULT="$(curl --silent ${DOCKER_HOST_URL}/ping)"

if [ "${RESULT}" != "pong" ]
then
    exit 1
fi
