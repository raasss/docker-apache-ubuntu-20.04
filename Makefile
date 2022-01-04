.PHONY: build
build:
	docker buildx build --progress plain \
	--tag localhost/apache-ubuntu-20.04:latest \
	--platform linux/amd64,linux/arm64 .