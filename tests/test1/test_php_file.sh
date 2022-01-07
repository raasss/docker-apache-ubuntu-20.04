RESULT="$(curl --silent ${DOCKER_HOST_URL}/index.php)"

if [ "${RESULT}" != "index.php" ]
then
    exit 1
fi
