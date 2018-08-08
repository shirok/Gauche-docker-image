VERSION=0.9.6
TAG=latest

image:
	docker build \
	   -t practicalscheme/gauche:$(VERSION) \
	   -t practicalscheme/gauche:$(TAG) \
	   --build-arg gauche_version=$(VERSION) \
	   .

run:
	docker run -ti --rm  practicalscheme/gauche:$(VERSION)


