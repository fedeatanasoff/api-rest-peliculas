const express = require("express");
const router = express.Router();
const conexionBD = require("../config/config");

const arrayActores = data => {
  let _data = data;
  for (const peli in _data) {
    const actoresArray = _data[peli].actores.split(",");
    _data[peli].actores = actoresArray;
  }

  return _data;
};

router.get("/api/peliculas", (req, res) => {
  const connection = conexionBD;
  const queryString = `
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
GROUP BY peliculas.peli_id, peliculas.peli_nombre ;
    `;

  connection.query(queryString, (err, data, fields) => {
    if (err) {
      return res.status(400).json({
        ok: false,
        message: "error al obtener los usuarios",
        error: err
      });
    }

    let resp = arrayActores(data);
    console.table(data);

    res.json({
      ok: true,
      data: resp
    });
  });
});

module.exports = router;
