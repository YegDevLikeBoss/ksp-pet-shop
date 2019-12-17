CREATE TABLE animal (
id INTEGER,
name TEXT,
kind TEXT,
price INTEGER,

PRIMARY KEY (id)
);

CREATE SEQUENCE hibernate_sequence START 1;

INSERT INTO public.animal (
id, name, kind, price)
VALUES (1, 'Madol Duwa', 'Martin Wickramasinghe', 4),
(2, 'Gamperaliya', 'Martin Wickramasinghe', 890);

SELECT setval('hibernate_sequence', (SELECT max(id) FROM public.animal));
