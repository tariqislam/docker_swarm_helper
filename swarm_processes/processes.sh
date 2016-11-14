#!/usr/bin/env bash

printf "Status:\n"
docker node ls
printf "\n"

for j in $(docker node ls | awk '/Ready/ { print $2, " ", $3 }' | awk '{ if ($1 != "*") { print $1 } else { print $2 } }'); do
	printf "Node: $j\n"
	docker node ps "$j"
	printf "\n"
done
