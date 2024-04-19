.PHONY: setup up down ps node

setup:
	@make up
	@make ps
down:
	docker compose down
up:
	docker compose up -d
ps:
	docker compose ps
node:
	docker compose exec node bash