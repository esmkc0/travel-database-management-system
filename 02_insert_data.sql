INSERT INTO app_user
VALUES (1, 'John Smith', 'john@gmail.com');

INSERT INTO country
VALUES (1, 'Poland');
INSERT INTO country
VALUES (2, 'Italy');
INSERT INTO country
VALUES (3, 'Germany');

INSERT INTO city
VALUES (1, 1, 'Warsaw');
INSERT INTO city
VALUES (2, 1, 'Krakow');
INSERT INTO city
VALUES (3, 2, 'Rome');
INSERT INTO city
VALUES (4, 3, 'Berlin');

INSERT INTO trip
VALUES (1,
        1,
        'Poland Trip',
        DATE '2026-05-01',
        DATE '2026-05-10',
        'Vacation in Poland');

INSERT INTO trip
VALUES (2,
        1,
        'Italy Trip',
        DATE '2026-06-15',
        DATE '2026-06-22',
        'Trip to Rome');

INSERT INTO trip_city
VALUES (1, 1);
INSERT INTO trip_city
VALUES (1, 2);
INSERT INTO trip_city
VALUES (2, 3);

INSERT INTO place
VALUES (1,
        1,
        'Old Town',
        'Tourist Attraction');

INSERT INTO place
VALUES (2,
        2,
        'Wawel Castle',
        'Castle');

INSERT INTO place
VALUES (3,
        3,
        'Colosseum',
        'Historical Site');

INSERT INTO trip_place
VALUES (1,
        1,
        1,
        DATE '2026-05-02',
        5,
        'Beautiful place');

INSERT INTO trip_place
VALUES (2,
        1,
        2,
        DATE '2026-05-05',
        4,
        'Interesting castle');

INSERT INTO trip_place
VALUES (3,
        2,
        3,
        DATE '2026-06-16',
        5,
        'Amazing experience');

INSERT INTO daily_note
VALUES (1,
        1,
        DATE '2026-05-02',
        'First day in Warsaw');

INSERT INTO photo
VALUES (1,
        1,
        1,
        'photo1.jpg',
        DATE '2026-05-02',
        'Old Town photo');

INSERT INTO accommodation
VALUES (1,
        1,
        1,
        'Hotel Warsaw',
        'Center Street 1',
        DATE '2026-05-01',
        DATE '2026-05-05');

INSERT INTO transportation
VALUES (1,
        1,
        1,
        2,
        'Train',
        DATE '2026-05-04',
        DATE '2026-05-04');

INSERT INTO expense
VALUES (1,
        1,
        DATE '2026-05-02',
        'Food',
        120.50,
        'PLN',
        'Restaurant');

INSERT INTO companion
VALUES (1,
        'Dua Lipa',
        'dua@gmail.com');

INSERT INTO trip_companion
VALUES (1,
        1);

COMMIT;