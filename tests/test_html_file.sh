RESULT="$(curl --silent ${DOCKER_HOST_URL}/index.html)"

# if [ "${RESULT}" != "index.htm" ]
# then
#     echo "Test failed!"
#     exit 1
# fi

test "${RESULT}" == "index.html"
