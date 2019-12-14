DROP TABLE IF EXISTS animal CASCADE; 
CREATE TABLE animal ( 
id INTEGER, 
name TEXT, 
kind TEXT, 
price TEXT, 

PRIMARY KEY (id) 
); 

INSERT INTO public.animal ( 
id, name, kind, price) 
VALUES (1, 'Madol Duwa', 'Martin Wickramasinghe', 4), 
(2, 'Gamperaliya', 'Martin Wickramasinghe', 890); 