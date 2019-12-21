CREATE TABLE animal(
    id INTEGER,
    name TEXT,
    kind TEXT,
    price INTEGER,
    PRIMARY KEY (id)
);

CREATE SEQUENCE hibernate_sequence START 1;

INSERT INTO public.animal(id, name, kind, price)
VALUES
    (0, 'Гена', 'Крокодил', 500),
    (1, 'Виктор', 'Паук', 0),
    (2, 'Кокос', 'Кот', 1000),
    (3, 'Гашишь', 'Мышь', 750);

SELECT setval('hibernate_sequence', (SELECT max(id) FROM public.animal));
