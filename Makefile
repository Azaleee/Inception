COMPOSE  = docker compose -f ./srcs/docker-compose.yml
DATA_DIR = /home/mosmont/data

.PHONY: up down re clean ps logs

up:
	mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mysql
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

re: down up

clean:
	$(COMPOSE) down -v
	@docker system prune --force --volumes --all
	rm -rf $(DATA_DIR)

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f
