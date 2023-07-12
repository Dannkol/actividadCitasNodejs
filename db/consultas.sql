USE citas;

SELECT * FROM usuarios ORDER BY usu_nombre ASC;

SELECT * FROM cita ORDER BY cit_fecha DESC;

SELECT t1.med_nombreCompleto , t2.esp_nombre FROM medico AS t1 INNER JOIN especialidad AS t2 ON t1.med_especialidad = t2.esp_id WHERE t2.esp_nombre = "Cardiologia"; 

SELECT * FROM cita AS t1 INNER JOIN usuarios AS t2 ON t1.cit_datosUsuario = t2.usu_id WHERE t2.usu_id = 1;
