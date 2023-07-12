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



export default router;
