const mysql = require("mysql");
const dbOpciones = {
  host: "localhost",
  user: "root",
  password: "",
  port: 3306,
  database: "api_peliculas"
};

const conexion = mysql.createConnection(dbOpciones);

conexion.connect(error => {
  return error
    ? console.log(`Error al conectarse a la BD: ${error.stack}`)
    : console.log(`Conexion establecida con la BD Nº ${conexion.threadId}`);
});

module.exports = conexion;
