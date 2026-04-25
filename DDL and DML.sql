CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_users_role
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id)
        ON DELETE SET NULL
);

CREATE TABLE films (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    release_date DATE,
    budget NUMERIC(12,2) CHECK (budget >= 0),
    duration_minutes INT,
    status VARCHAR(50)
);

CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(50)
);

CREATE TABLE crew (
    crew_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50),
    salary NUMERIC(10,2) CHECK (salary >= 0)
);

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE schedules (
    schedule_id SERIAL PRIMARY KEY,
    film_id INT NOT NULL,
    location_id INT NOT NULL,
    shoot_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,

    CONSTRAINT fk_schedule_film
        FOREIGN KEY (film_id)
        REFERENCES films(film_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_schedule_location
        FOREIGN KEY (location_id)
        REFERENCES locations(location_id)
        ON DELETE CASCADE
);

CREATE TABLE film_cast (
    film_id INT,
    actor_id INT,
    character_name VARCHAR(100),

    PRIMARY KEY (film_id, actor_id),

    CONSTRAINT fk_cast_film
        FOREIGN KEY (film_id)
        REFERENCES films(film_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cast_actor
        FOREIGN KEY (actor_id)
        REFERENCES actors(actor_id)
        ON DELETE CASCADE
);

CREATE TABLE film_crew (
    film_id INT,
    crew_id INT,
    responsibility VARCHAR(100),

    PRIMARY KEY (film_id, crew_id),

    CONSTRAINT fk_crew_film
        FOREIGN KEY (film_id)
        REFERENCES films(film_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_crew_member
        FOREIGN KEY (crew_id)
        REFERENCES crew(crew_id)
        ON DELETE CASCADE
);

INSERT INTO roles (role_id, role_name) VALUES
(1, 'Admin'),
(2, 'Production_Manager'),
(3, 'Crew'),
(4, 'Viewer'),
(5, 'Editor'),
(6, 'Director'),
(7, 'Assistant');

INSERT INTO users (user_id, username, password, email, role_id) VALUES
(56,'admin1', 'pass123', 'admin1@mail.com', 1),
(57, 'manager1', 'pass123', 'manager1@mail.com', 2),
(58, 'crew1', 'pass123', 'crew1@mail.com', 3),
(59, 'viewer1', 'pass123', 'viewer1@mail.com', 4),
(60, 'editor1', 'pass123', 'editor1@mail.com', 5),
(61, 'director1', 'pass123', 'director1@mail.com', 6),
(62, 'assistant1', 'pass123', 'assistant1@mail.com', 7);

INSERT INTO films (film_id, title, genre, release_date, budget, duration_minutes, status) VALUES
(1, 'Inception', 'Sci-Fi', '2010-07-16', 160000000, 148, 'Released'),
(2, 'Interstellar', 'Sci-Fi', '2014-11-07', 165000000, 169, 'Released'),
(3, 'The Dark Knight', 'Action', '2008-07-18', 185000000, 152, 'Released'),
(4, 'Avatar', 'Fantasy', '2009-12-18', 237000000, 162, 'Released'),
(5, 'Titanic', 'Romance', '1997-12-19', 200000000, 195, 'Released'),
(6, 'Gladiator', 'Action', '2000-05-05', 103000000, 155, 'Released'),
(7, 'The Matrix', 'Sci-Fi', '1999-03-31', 63000000, 136, 'Released');

INSERT INTO actors (actor_id, first_name, last_name, date_of_birth, nationality) VALUES
(1, 'Leonardo', 'DiCaprio', '1974-11-11', 'American'),
(2, 'Matthew', 'McConaughey', '1969-11-04', 'American'),
(3, 'Christian', 'Bale', '1974-01-30', 'British'),
(4, 'Sam', 'Worthington', '1976-08-02', 'Australian'),
(5, 'Kate', 'Winslet', '1975-10-05', 'British'),
(6, 'Russell', 'Crowe', '1964-04-07', 'New Zealander'),
(7, 'Keanu', 'Reeves', '1964-09-02', 'Canadian');

INSERT INTO crew (crew_id, first_name, last_name, role, salary) VALUES
(1, 'Christopher', 'Nolan', 'Director', 20000000),
(2, 'Hans', 'Zimmer', 'Composer', 5000000),
(3, 'Wally', 'Pfister', 'Cinematographer', 3000000),
(4, 'James', 'Cameron', 'Director', 25000000),
(5, 'Ridley', 'Scott', 'Director', 15000000),
(6, 'Lana', 'Wachowski', 'Director', 10000000),
(7, 'Lilly', 'Wachowski', 'Director', 10000000);

INSERT INTO locations (location_id, location_name, city, country) VALUES
(1, 'Warner Bros Studio', 'Los Angeles', 'USA'),
(2, 'Iceland Plains', 'Reykjavik', 'Iceland'),
(3, 'Gotham Set', 'Chicago', 'USA'),
(4, 'Pandora Set', 'Wellington', 'New Zealand'),
(5, 'Atlantic Tank', 'Rosarito', 'Mexico'),
(6, 'Colosseum Set', 'Rome', 'Italy'),
(7, 'Matrix City', 'Sydney', 'Australia');

INSERT INTO schedules (schedule_id, film_id, location_id, shoot_date, start_time, end_time) VALUES
(36, 1, 1, '2026-05-01', '08:00', '16:00'),
(37, 2, 2, '2026-05-02', '09:00', '17:00'),
(38, 3, 3, '2026-05-03', '07:00', '15:00'),
(39, 4, 4, '2026-05-04', '10:00', '18:00'),
(40, 5, 5, '2026-05-05', '08:30', '16:30'),
(41, 6, 6, '2026-05-06', '09:00', '17:00'),
(42, 7, 7, '2026-05-07', '08:00', '16:00');

INSERT INTO film_cast (film_id, actor_id, character_name) VALUES
(1, 1, 'Cobb'),
(2, 2, 'Cooper'),
(3, 3, 'Batman'),
(4, 4, 'Jake Sully'),
(5, 5, 'Rose'),
(6, 6, 'Maximus'),
(7, 7, 'Neo');

INSERT INTO film_crew (film_id, crew_id, responsibility) VALUES
(1, 1, 'Director'),
(1, 2, 'Music'),
(2, 1, 'Director'),
(3, 1, 'Director'),
(4, 4, 'Director'),
(6, 5, 'Director'),
(7, 6, 'Director');