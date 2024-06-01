DOCKER-COMPOSE=docker-compose -f docker-compose.yaml

up:
	$(DOCKER-COMPOSE) up -d	

down:
	$(DOCKER-COMPOSE) down 

down-volumes:
	$(DOCKER-COMPOSE) down -v

	
clean: down-volumes
	docker system prune --volumes -f
	
logs:
	$(DOCKER-COMPOSE) logs -t -f

.PHONY: up down down-volumes logs clean
