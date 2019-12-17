mvn_build:
	mvn install

db_image:
	sudo docker build ./sql -t mypostgres

app_image: mvn_build
	sudo docker build ./ -t mywebapp

build: mvn_build db_image app_image

reset:
	sudo docker-compose rm -f
	sudo docker volume rm csa_lab_petshop_pgdata

run:
	sudo docker-compose up
