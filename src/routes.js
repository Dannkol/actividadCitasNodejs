import express from "express";

import mysql from "mysql2/promise";
import dbConfig from "./config/dbconfig.js";

/* instacia de la conexion a la base de datos */
const getConnection = async () => {
  return await mysql.createConnection(dbConfig);
};

const router = express.Router();

router.get("/pacientes", async (req, res) => {
  const connection = await getConnection();
  try {
    const query_pacientes_all_desc = `SELECT * FROM usuarios ORDER BY usu_nombre ASC;`;

    const [pacientes_all_desc] = await connection.execute(
      query_pacientes_all_desc
    );

    let obj = {
      mensaje: "Uusuarios ordered by usu_nombre ascending",
      inventario: pacientes_all_desc,
    };

    return res.status(200).json(obj);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: `Error del servidor ${error.errno}` });
  } finally {
    connection.end();
  }
});

router.get("/citas", async (req, res) => {
  const connection = await getConnection();
  try {
    const query_pacientes_all_desc = `SELECT * FROM cita ORDER BY cit_fecha DESC;`;

    const [pacientes_all_desc] = await connection.execute(
      query_pacientes_all_desc
    );

    let obj = {
      mensaje: "citas ordered by cit_fecha DESC",
      inventario: pacientes_all_desc,
    };

    return res.status(200).json(obj);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: `Error del servidor ${error.errno}` });
  } finally {
    connection.end();
  }
});


router.get("/medicos/:esp", async (req, res) => {
  const connection = await getConnection();
  try {
    const query_pacientes_all_desc = `SELECT t1.med_nombreCompleto , t2.esp_nombre FROM medico AS t1 INNER JOIN especialidad AS t2 ON t1.med_especialidad = t2.esp_id WHERE t2.esp_nombre = "${req.params.esp}"; `;

    const [pacientes_all_desc] = await connection.execute(
      query_pacientes_all_desc
    );

    let obj = {
      mensaje: "citas ordered by cit_fecha DESC",
      inventario: pacientes_all_desc,
    };

    return res.status(200).json(obj);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: `Error del servidor ${error.errno}` });
  } finally {
    connection.end();
  }
});


export default router;
