docker_compose = docker compose --project-directory srcs

up:
	$(docker_compose) up --build

down:
	$(docker_compose) down

stop:
	$(docker_compose) stop

clean:
	docker volume rm ${shell docker volume ls -q}
	docker system prune -a -f