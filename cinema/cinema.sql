/*CREATE DATABASE IF NO EXISTS cinema
    DEFAULT CHARACTER SET = 'utf8mb4'*/


CREATE USER 'superadmin@me.fr' IDENTIFIED BY '2y$10$RY3iy2qMyGZJRDgd7';

GRANT ALL ON cinema.* TO 'superadmin@me.fr';
CREATE USER 'ecarnall0@w3.org' IDENTIFIED BY '$2y$10$CV8yDaZJRDgd7sgOyTv9L';
CREATE USER 'mwisson1@wix.com' IDENTIFIED BY '$2y$10$RY3iy2qMyGTa/9lAypjP';
CREATE USER 'mmelendez2@a8.net' IDENTIFIED BY '$2y$10$AGTdidcsk6tLK0CB/';

GRANT INSERT, UPDATE, DELETE, SELECT ON cinema.projection TO 'ecarnall0@w3.org', 'mwisson1@wix.com', 'mmelendez2@a8.net';


CREATE TABLE admin (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    username VARCHAR(20)NOT NULL UNIQUE,
    full_name VARCHAR(20)NOT NULL,
    email VARCHAR(50)NOT NULL,
    password VARCHAR(50)NOT NULL
) ENGINE=InnoDB ;

CREATE TABLE client (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    username VARCHAR(20)NOT NULL UNIQUE,
    full_name VARCHAR(20)NOT NULL,
    email VARCHAR(50)NOT NULL,
    password VARCHAR(50)NOT NULL
) ENGINE=InnoDB ;

CREATE TABLE movie_theater (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    adress VARCHAR(50),
    zip_code INTEGER(10),
    city VARCHAR(50),
    phone INTEGER,
    admin_id INTEGER NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES admin(id)
) ENGINE=InnoDB ;



CREATE TABLE movie_rooms (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    room_number INTEGER,
    capacity INTEGER(4),
    theater_id INTEGER NOT NULL,
    FOREIGN KEY (theater_id) REFERENCES movie_theater(id)
) ENGINE=InnoDB ;
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    duration INTEGER (10),
    time_unit VARCHAR(5)
) ENGINE=InnoDB ;

CREATE TABLE projection (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    projection_time DATETIME,
    movie_room_id INTEGER(3) NOT NULL,
    movie_id INTEGER(3) NOT NULL,
    FOREIGN KEY (movie_room_id) REFERENCES movie_rooms(id)ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE  
) ENGINE=InnoDB ;


CREATE TABLE tarifs (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    price INTEGER(10),
    currency VARCHAR(1)
)ENGINE=InnoDB ;

CREATE TABLE reservations (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    reservation_date DATETIME,
    online_checkout VARCHAR(50) NOT NULL,
    client_id INTEGER ,
    projection_id INTEGER ,
    tarif_id INTEGER ,
    FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE,
    FOREIGN KEY (projection_id) REFERENCES projection(id) ON DELETE CASCADE,
    FOREIGN KEY (tarif_id) REFERENCES tarifs(id) ON DELETE CASCADE
)ENGINE=InnoDB ;

INSERT INTO admin ( id, username, full_name, email, password) VALUES 
    (1, '46-9066298', 'Eran Carnall', 'ecarnall0@w3.org', '$2y$10$CV8yDaZJRDgd7sgOyTv9L'),
    (2, '33-7335905', 'Mersey Wisson', 'mwisson1@wix.com', '$2y$10$RY3iy2qMyGTa/9lAypjP'),
    (3, '84-1821488', 'Michele Melendez', 'mmelendez2@a8.net', '$2y$10$AGTdidcsk6tLK0CB/');

INSERT INTO client ( id, username, full_name, email, password) VALUES 
    (1, '62-2396331', 'Ariadne Brennand', 'abrennand0@paypal.com', 'AYIr9wO2DwC'),
    (2, '93-0512642', 'Ignacius Brecher', 'ibrecher1@ihg.com', '0dmV4L'),
    (3, '17-4229666', 'Gannie Andrzejowski', 'gandrzejowski2@google.ru', 'BEQDTwIp84Iy'),
    (4, '29-9573618', 'Korella Dovey', 'kdovey3@nhs.uk', '3SkHoYw'),
    (5, '13-9579187', 'Orran Butterfield', 'obutterfield4@nytimes.com', 'GokeeuKeKGz'),
    (6, '73-8508281', 'Luce Sivill', 'lsivill5@dropbox.com', 'qfvTP6dTD1'),
    (7, '25-6210650', 'Beauregard Rockwell', 'brockwell6@ning.com', 'u4nQM7C'),
    (8, '54-9303632', 'Dewey Stobbart', 'dstobbart7@tmall.com', 'e9MYgm3tL6'),
    (9, '99-0281406', 'Florry Westrope', 'fwestrope8@wp.com', '4jpnrDW2rtJ'),
    (10, '65-3644963', 'Tyrone Hardaker', 'thardaker9@tripod.com', 'iaKDLmcVPlZ');

INSERT INTO movie_theater (id, name, adress, zip_code, city, phone, admin_id) VALUES
    (1, 'Cinéma Les Halles', '7 place de la Rotonde', 75001,'Paris', 0826880700 ,3),
    (2, 'Cinéma Cité Bordeaux', '13-15 Rue Georges Bonnac',33000, 'Bordeaux', 0826880800 ,2),
    (3, 'Cinéma Cité Lille', '40 Rue de Béthune',59800, 'Lille', 0826880900,1);

INSERT INTO movie_rooms (id, room_number, capacity, theater_id) VALUES 
(1, 5, 300, 3),
(2, 4, 200, 3),
(3, 3, 250, 3),
(4, 2, 150, 3),
(5, 1, 200, 3),

(6, 5, 200, 1),
(7, 4, 250, 1),
(8, 3, 300, 1),
(9, 2, 150, 1),
(10, 1, 200, 1),

(11, 5, 200, 2),
(12, 4, 250, 2),
(13, 3, 250, 2),
(14, 2, 300, 2),
(15, 1, 150, 2);


INSERT INTO movies (id, name, duration, time_unit) VALUES 

(1,'Dragon Ball Z: Super Android 13!', 82, 'min'),
(2,'E.T', 105, 'min'),
(3,'Come to the Stable', 94, 'min'),
(4,'Round Midnight', 133, 'min'),
(5,'Magnitude 10.5',165, 'min');

INSERT INTO projection (id, projection_time, movie_room_id, movie_id) VALUES
(1, '2022-07-27 10:30:00', 1, 5),
(2, '2022-07-27 10:30:00', 2, 5),
(3, '2022-07-27 09:40:00', 3, 1),
(4, '2022-07-27 11:30:00', 4, 2),
(5, '2022-07-27 12:30:00', 5, 3),

(6, '2022-07-27 10:30:00', 1, 1),
(7, '2022-07-27 14:00:00', 2, 4),
(8, '2022-07-27 20:30:00', 3, 1),
(9, '2022-07-27 20:30:00', 4, 1),
(10, '2022-07-27 16:00:00', 5, 4),

(11, '2022-07-27 10:30:00', 1, 1),
(12, '2022-07-27 10:30:00', 2, 2),
(13, '2022-07-27 17:00:00', 3, 3),
(14, '2022-07-27 10:30:00', 4, 4),
(15, '2022-07-27 17:00:00', 5, 5);

INSERT INTO tarifs (id, name, price, currency) VALUES
(1,'Plein tarif', 9.20, '€'),
(2,'Etudiant', 7.60, '€'),
(3,'Moins de 14 ans', 5.90, '€');

INSERT INTO reservations (id, reservation_date, online_checkout, client_id, projection_id, tarif_id) VALUES
(1, '2022-07-25 12:00:00', 'Paiement en ligne', 1, 1,1),
(2, '2022-07-24 11:00:00', 'Paiement sur place', 2, 2,2),
(3, '2022-07-26 18:00:00', 'Paiement sur place', 3, 3,2),
(4, '2022-07-25 13:00:00', 'Paiement en ligne', 4, 4,1),
(5, '2022-07-25 21:00:00', 'Paiement sur place', 5, 5,1),
(6, '2022-07-26 17:00:00', 'Paiement en ligne', 6, 1,1),
(7, '2022-07-25 16:00:00', 'Paiement en ligne', 7, 7,3),
(8, '2022-07-25 17:00:00', 'Paiement sur place', 8, 6,3),
(9, '2022-07-24 15:00:00', 'Paiement sur place', 9, 14,2),
(10, '2022-07-25 14:00:00', 'Paiement sur place', 10, 12,1);



/*Ici nous pouvons voir que la marque possède plusieurs complexes*/
SELECT * from movie_theater;


/*Il y a un admin par complexe */
SELECT name, admin_id FROM movie_theater
INNER JOIN admin
WHERE admin.id = movie_theater.admin_id;


/* Chaque complexe possède plusieurs salles avec chacunes un nombre de place défini*/ 
SELECT * FROM movie_theater
INNER JOIN movie_rooms
WHERE movie_theater.id = movie_rooms.theater_id;

/* Il y a des séances du même film à la même heure dans le même cinéma*/

SELECT projection_time, movie_room_id, movie_id FROM projection WHERE projection_time = '2022-07-27 20:30:00'
OR projection_time = '2022-07-27 17:00:00'
OR projection_time = '2022-07-27 10:30:00';


/* Il y a 3 tarifs disponibles*/
SELECT * FROM tarifs;



/* Afficher le type de paiement*/
SELECT online_checkout, client_id
FROM reservations 
INNER JOIN client;

/* La table reservations permet de relier un client à sa reservation mais aussi de voir le tarif qui lui correspond*/

SELECT * FROM reservations;









