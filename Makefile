up:
	docker compose up

prune:
	docker system prune -a -f
	rm -rf ~/Desktop/data/*

down:
	docker compose down

clean: down prune