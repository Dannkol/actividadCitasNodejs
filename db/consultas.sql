USE citas;

SELECT * FROM usuarios ORDER BY usu_nombre ASC;

SELECT * FROM cita ORDER BY cit_fecha DESC;

SELECT t1.med_nombreCompleto , t2.esp_nombre FROM medico AS t1 INNER JOIN especialidad AS t2 ON t1.med_especialidad = t2.esp_id WHERE t2.esp_nombre = "Cardiologia"; 

SELECT * FROM usuarios AS t1 INNER JOIN cita AS t2 ON t1.med
