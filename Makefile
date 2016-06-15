.PHONY: image all clean


REPO=2infinity/transmission
TAG=$(REPO):latest


image:
	docker build -t $(TAG) .

all: image

clean: 
	docker rmi $(TAG)
