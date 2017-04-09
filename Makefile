.PHONY: help
SHELL := /bin/bash
ENV = $(filter-out $(firstword $(MAKECMDGOALS)), $(MAKECMDGOALS))

ifeq ($(strip $(ENV)),)
	ENV=development
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; { printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

start: ## start local environment. Usage: make start [production|staging|development]. Defaults to development.
	@if [ ! $(ENV) = production ] && [ ! $(ENV) = staging ] && [ ! $(ENV) = development ]; then \
	echo "Environment was not set correctly, check README.md or help"; exit 10; fi
	@cd .docker/$(ENV); \
	eval "cat <<< \"$$(< '.env-$(ENV).template')\" > '.env-$(ENV)'"; \
	if [ $(ENV) = development ]; then \
	./start-development.sh; else \
	docker-compose -f docker-compose-$(ENV).yml up; \
	rm .env-$(ENV); fi

build: ## build local environment. Usage: make build [production|staging|development]. Defaults to development.
	@if [ ! $(ENV) = production ] && [ ! $(ENV) = staging ] && [ ! $(ENV) = development ]; then \
	echo "Environment was not set properly, check README.md or help"; exit 10; fi
	@cp .docker/$(ENV)/.env-$(ENV).template .docker/$(ENV)/.env-$(ENV); \
	cp .docker/$(ENV)/docker-compose-$(ENV).yml ./; \
	cp .docker/$(ENV)/Dockerfile ./;
	docker-compose -f .docker/$(ENV)/docker-compose-$(ENV).yml build; \
	rm .docker/$(ENV)/.env-$(ENV) docker-compose-$(ENV).yml ./Dockerfile

test: ## test local environment. Usage: make test [production|staging|development]. Defaults to development.
	@if [ ! $(ENV) = production ] && [ ! $(ENV) = staging ] && [ ! $(ENV) = development ]; then \
	echo "Environment was not set properly, check README.md or help"; exit 10; fi
	@docker exec -t imi-maps-$(ENV) rake spec

enter: ## enter local environment
	@if [ ! $(ENV) = production ] && [ ! $(ENV) = staging ] && [ ! $(ENV) = development ]; then \
	echo "Environment was not set properly, check README.md or help"; exit 10; fi
	@docker exec -ti imi-maps-$(ENV) bash

database: ## reseed database
	@if [ ! $(ENV) = production ] && [ ! $(ENV) = staging ] && [ ! $(ENV) = development ]; then \
	echo "Environment was not set properly, check README.md or help"; exit 10; fi
	@docker exec -ti imi-maps-$(ENV) bash -c 'cd /usr/src/app && bundle exec rake db:reseed'

%:
	@:
