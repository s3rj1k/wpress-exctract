GO_BUILD_ENV = CGO_ENABLED=0
GO_BUILD_FLAGS ?= --tags "netgo osusergo static_build"
LDFLAGS = -s -w -extldflags "-static"

.PHONY: tidy
tidy:
	env $(GO_BUILD_ENV) go mod tidy -v

.PHONY: vendor
vendor:
	go mod vendor -v

.PHONY: verify
verify:
	go mod verify

.PHONY: build
build:
	env $(GO_BUILD_ENV) go build $(GO_BUILD_FLAGS) -ldflags='$(LDFLAGS)' -a -o 'wpress-extract'
