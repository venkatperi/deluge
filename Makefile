all: build

build:
	@docker build --rm --tag=venkatperi/deluge .

