VERSION=0.9.15
TAG=latest

image:
	docker buildx build \
	   -t practicalscheme/gauche:$(VERSION) \
	   -t practicalscheme/gauche:$(TAG) \
	   --build-arg gauche_version=$(VERSION) \
	   .

push:
	docker push practicalscheme/gauche:$(VERSION)
	docker push practicalscheme/gauche:$(TAG)

run:
	docker run -ti --rm  practicalscheme/gauche:$(VERSION)
