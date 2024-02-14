all:
	@docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker volume rm $$(docker volume ls -q);
	@echo "Clean volumes.";

fclean: down clean
	@sudo rm -rf /home/jaeshin/data/mysql/*;
	@sudo rm -rf /home/jaeshin/data/wordpress/*;
	@echo "Fclean volumes and data";

re: fclean all

.PHONY: all re down clean fclean
