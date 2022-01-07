RESULT="$(curl --silent ${DOCKER_HOST_URL})"

if [ "${RESULT}" != "index.html" ]
then
    exit 1
fi
