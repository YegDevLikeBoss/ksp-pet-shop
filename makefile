mvn_build:
	mvn install -DskipTests

db_image:
	sudo docker build ./postgresql -t mypostgres

app_image: mvn_build
	sudo docker build ./ -t mywebapp

build: mvn_build db_image app_image

reset:
	sudo docker-compose rm -f
	sudo docker volume rm pet_shop_pgdata

run:
	sudo docker-compose up
