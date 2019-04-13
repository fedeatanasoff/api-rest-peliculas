DROP DATABASE IF EXISTS peliculas;

CREATE DATABASE IF NOT EXISTS peliculas;

USE peliculas;

CREATE TABLE peliculas (
    peli_id INTEGER PRIMARY KEY,
    peli_nombre VARCHAR(100) NOT NULL,
    peli_pais VARCHAR(100) NOT NULL,
    peli_fecha_estreno DATE NOT NULL,
    peli_director VARCHAR(100) NOT NULL
);

CREATE TABLE actores (
    actor_id INTEGER PRIMARY KEY,
    actor_nombre VARCHAR(100) NOT NULL,
    actor_apellido VARCHAR(100) NOT NULL
);

CREATE TABLE peli_actor (
    peli_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,    
    FOREIGN KEY (peli_id) REFERENCES peliculas (peli_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actores (actor_id) ON DELETE RESTRICT ON UPDATE CASCADE
);