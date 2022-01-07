RESULT="$(curl --silent ${DOCKER_HOST_URL}/status)"

if ! echo "${RESULT}" | grep '^pool:' 1>/dev/null
then
    exit 1
fi
