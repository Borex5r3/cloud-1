
all:
	@mkdir -p /home/$(USER)/data/wordpress
	@mkdir -p /home/$(USER)/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --build -d

stop:
	@docker compose -f srcs/docker-compose.yml down


clean:
	@echo "\033[1;34m🧹 Cleaning Docker containers and volumes...\033[0m"
	@if [ -n "$$(docker ps -aq)" ]; then \
		echo "\033[1;33m⚠️  Stopping and removing all Docker containers...\033[0m"; \
		docker rm -f $$(docker ps -aq) > /dev/null && \
		echo "\033[1;32m✅ All containers removed successfully.\033[0m"; \
	else \
		echo "\033[1;36mℹ️  No containers found to remove.\033[0m"; \
	fi
	@if [ -d "/home/$(USER)/data/wordpress" ]; then \
		echo "\033[1;33m🗑️  Removing WordPress data...\033[0m"; \
		doas rm -rf /home/$(USER)/data/wordpress/* && \
		echo "\033[1;32m✅ WordPress data cleaned.\033[0m"; \
	else \
		echo "\033[1;36mℹ️  WordPress data directory not found.\033[0m"; \
	fi
	@if [ -d "/home/$(USER)/data/mariadb" ]; then \
		echo "\033[1;33m🗑️  Removing MariaDB data...\033[0m"; \
		doas rm -rf /home/$(USER)/data/mariadb/* && \
		echo "\033[1;32m✅ MariaDB data cleaned.\033[0m"; \
	else \
		echo "\033[1;36mℹ️  MariaDB data directory not found.\033[0m"; \
	fi

fclean: clean
	@docker system prune -af
	
	@docker volume rm -f $$(docker volume ls -q)  &> /dev/null ; true
	@docker network rm -f $$(docker network ls -q) &> /dev/null ; true

re: fclean all
