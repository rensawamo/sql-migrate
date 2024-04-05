

.PHONY: help
help:
	@echo "usage: make <target>"
	@echo
	@echo "---- target list ----"
	@cat Makefile \
		| awk -F: '/^## /{desc=substr($$0,4)} /^[a-zA-Z_-]+:/&&desc{printf "% 9s: %s\n",$$1,desc; desc=""}'													

.PHONY: docker-up
docker-up:
	docker compose up -d 

.PHONY: docker-down
docker-down:
	docker-compose down

.PHONY: migrate
migrate:
	sql-migrate up 



