current	= $$(git rev-parse --abbrev-ref HEAD | sed 's/\//-/g')-$$(git rev-parse HEAD | cut -c1-7)

release: build-release push-release

build-release:
	@TARGET=prod TAG=$(current) docker-compose -f docker-compose.yml build

push-release:
	@TARGET=prod TAG=$(current) docker-compose -f docker-compose.yml push