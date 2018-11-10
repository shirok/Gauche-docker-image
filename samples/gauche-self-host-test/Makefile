.PHONY: image push run clean

VERSION=0.9.6
BUILD=-build2

Dockerfile : Dockerfile.in
	sed 's/@base_gauche_version@/$(VERSION)/g' Dockerfile.in > Dockerfile

image: Dockerfile
	docker build \
	  -t practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD) \
	  .

push: image
	docker push practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD)

run:
	docker run -ti --rm practicalscheme/gauche-self-host-test:$(VERSION)$(BUILD)

run-ephemeral: Dockerfile
	docker run --rm -ti `docker build -q .`

clean:
	rm -f Dockerfile *~ scripts/*~

