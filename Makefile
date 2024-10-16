docker_compose = docker compose --project-directory src

up:
	$(docker_compose) up

prune:
	docker system prune -a -f
	rm -rf ~/Desktop/data/*

down:
	$(docker_compose) down

clean: down prune