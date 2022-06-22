current	= $$(git rev-parse --abbrev-ref HEAD | sed 's/\//-/g')-$$(git rev-parse HEAD | cut -c1-7)

# Production
release: build-release push-release

build-release:
	@TARGET=prod TAG=$(current) docker-compose -f docker-compose.yml build

push-release:
	@TARGET=prod TAG=$(current) docker-compose -f docker-compose.yml push

# Development
dev:
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build