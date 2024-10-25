docker_compose = docker compose --project-directory srcs

up:
	$(docker_compose) up

prune:
	docker system prune -a -f
	rm -rf ~/Desktop/data/wordpress/*
	rm -rf ~/Desktop/data/database/*

down:
	$(docker_compose) down

clean: down prune