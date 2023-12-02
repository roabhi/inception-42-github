# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rabril-h <rabril-h@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/02 17:33:55 by rabril-h          #+#    #+#              #
#    Updated: 2023/12/02 17:34:40 by rabril-h         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/rabril-h/data/mysql
	@mkdir -p /home/rabril-h/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker compose -f ./srcs/docker-compose.yml down -v
	@docker system prune --all --force
	@docker volume prune --all --force
	@docker network rm rabril-hnet

fclean: clean
	@sudo rm -rf /home/rabril-h/data

.PHONY: all down clean fclean