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

