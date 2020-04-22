DIR := ${CURDIR}
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

all: build copy

build:
	docker build -t grex .

copy:
	docker run --rm -v $(DIR):/out -u $(CURRENT_UID):$(CURRENT_GID) grex cp target/release/grex /out
	ls -la grex
	./grex --version

clean:
	docker rmi -f grex
	docker rmi -f rust

