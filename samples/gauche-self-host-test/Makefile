.PHONY: image push run clean

VERSION=0.9.15
BUILD=-build1
TESTSCRIPTS=$(shell echo scripts/*.sh)

Dockerfile : gen-dockerfile.sh scripts/self-host-test $(TESTSCRIPTS)
	./gen-dockerfile.sh $(VERSION)

image: Dockerfile
	docker build \
	  -t practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD) \
	  .

push: image
	docker push practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD)

run:
	docker run -ti --rm practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD)

run-sh:
	docker run -ti --rm practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD) /bin/bash

run-ephemeral: Dockerfile
	docker run --rm -ti `docker build -q .`

clean:
	rm -f Dockerfile *~ scripts/*~
