
.PHONY: all build-* exec-* all-*

all: build-base push-base build-golang push-golang

all-%:
	$(MAKE) build-$* push-$*

build-%:
	docker build . -f Dockerfile.$* --platform linux/amd64 -t ghcr.io/rmkraus/workspace:$*

run-%:
	docker run --rm -it --platform linux/amd64 ghcr.io/rmkraus/workspace:$* /usr/bin/bash

push-%:
	docker push ghcr.io/rmkraus/workspace:$*

