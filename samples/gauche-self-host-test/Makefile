.PHONY: image push run clean

VERSION=0.9.6

Dockerfile : Dockerfile.in
	sed 's/@base_gauche_version@/$(VERSION)/g' Dockerfile.in > Dockerfile

image: Dockerfile
	docker build \
	  -t practicalscheme/gauche-self-host-test:$(VERSION) \
	  .

push:
	docker push practicalscheme/gauche-self-host-test:$(VERSION)

run:
	docker run -ti --rm practicalscheme/gauche-self-host-test:$(VERSION)

clean:
	rm -f Dockerfile *~
