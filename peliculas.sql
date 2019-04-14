DROP DATABASE IF EXISTS api_peliculas;

CREATE DATABASE IF NOT EXISTS api_peliculas;

USE api_peliculas;


CREATE TABLE peliculas (
  peli_id INT not null auto_increment PRIMARY KEY,
  peli_nombre VARCHAR(100) NOT NULL,
  peli_pais VARCHAR(100) NOT NULL,
  peli_fecha_estreno DATE NOT NULL,
  peli_director VARCHAR(100) NOT NULL
);

CREATE TABLE actores (
  actor_id INT not null auto_increment PRIMARY KEY,
  actor_nombre VARCHAR(100) NOT NULL,
  actor_apellido VARCHAR(100) NOT NULL
);


CREATE TABLE peli_actor (
    peli_id INT NOT NULL,
    actor_id INT NOT NULL,    
    FOREIGN KEY (peli_id) REFERENCES peliculas (peli_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actores (actor_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO peliculas(peli_nombre, peli_pais, peli_fecha_estreno, peli_director) VALUES("Matrix", "US", "1999-06-23", "Lana Wachowsky");
INSERT INTO actores(actor_nombre, actor_apellido) VALUES("Keanu", "Reeves");
INSERT INTO actores(actor_nombre, actor_apellido) VALUES("Laurence", "Fishburne");
INSERT INTO peli_actor VALUES(1,1);
INSERT INTO peli_actor VALUES(1,2);
SELECT * FROM peliculas;
SELECT * FROM actores;

SELECT 
   peliculas.peli_id,
   peliculas.peli_nombre, 
   peliculas.peli_pais,
   peliculas.peli_fecha_estreno,
   peliculas.peli_director, 
   GROUP_CONCAT(actores.actor_nombre, ' ', actores.actor_apellido) AS actores
 FROM peliculas 
   INNER JOIN peli_actor ON peliculas.peli_id = peli_actor.peli_id
   INNER JOIN actores ON peli_actor.actor_id = actores.actor_id
 GROUP BY peliculas.peli_id, peliculas.peli_nombre;