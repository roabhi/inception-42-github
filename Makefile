# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rabril-h <rabril-h@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/02 17:33:55 by rabril-h          #+#    #+#              #
#    Updated: 2023/12/06 18:26:03 by rabril-h         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/rabril-h/data/mysql
	@mkdir -p /home/rabril-h/data/wordpress
	@docker compose -f ./src/docker-compose.yml up -d --build

down:
	@docker compose -f ./src/docker-compose.yml down

clean: down
	@docker compose -f ./src/docker-compose.yml down -v
	@docker system prune --all --force
	@docker volume prune --all --force
	@docker network rm rabril-hnet

fclean: clean
	@sudo rm -rf /home/rabril-h/data

.PHONY: all down clean fclean