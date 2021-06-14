PSQL 

CREATE DATABASE recipe_library;

\c recipe_library;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS meal_planning;

CREATE TABLE meal_planning (
    id SERIAL PRIMARY KEY,
    meal_item TEXT,
    calories INTEGER,
    ingredients TEXT,
    recipe TEXT,
    category TEXT,
    image_url TEXT,
    user_id INTEGER
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT
);
