up:
	docker compose up

prune:
	docker system prune -a -f

down:
	docker compose down

clean: down prune