RESULT="$(curl --silent ${DOCKER_HOST_URL}/phpinfo.php)"

if ! echo "${RESULT}" | grep 'phpinfo()' 1>/dev/null
then
    exit 1
fi
