NAME     := rdm

VERSION  := v0.1.0
REVISION := $(shell git rev-parse --shart HEAD)

SRCS     := $(shell find . -type f -name '*.go')

LDFLAGS  := -ldflags="-s -w -X \"main.Version=$(VERSION)\" -X \"main.Revision=$(REVISION)\" -extldflags \"-static\""

.DEFAULT_GOAL  := bin/$(NAME)

bin/$(NAME): $(SRCS)
	go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o bin/$(NAME)
