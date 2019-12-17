mvn_build:
	mvn install

db_image:
	sudo docker build ./sql -t mypostgres

app_image: mvn_build
	sudo docker build ./ -t mywebapp

install: mvn_build db_image app_image
	sudo docker-compose up
