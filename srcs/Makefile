docker_compose = docker compose --project-directory srcs

all: up

up:
	$(docker_compose) up

down:
	$(docker_compose) down

stop:
	$(docker_compose) stop

clean: down
	docker volume rm ${shell docker volume ls -q}
	docker system prune -a -f