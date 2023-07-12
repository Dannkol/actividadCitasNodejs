USE citas;

SELECT * FROM usuarios ORDER BY usu_nombre ASC;

SELECT * FROM cita ORDER BY cit_fecha DESC;

SELECT t1.med_nombreCompleto , t2.esp_nombre FROM medico AS t1 INNER JOIN especialidad AS t2 ON t1.med_especialidad = t2.esp_id WHERE t2.esp_nombre = "Cardiologia"; 

SELECT t2.usu_nombre, t1.cit_fecha FROM cita AS t1 INNER JOIN usuarios AS t2 ON t1.cit_datosUsuario = t2.usu_id WHERE t2.usu_id = 1 AND t1.cit_estado = 1
ORDER BY t1.cit_fecha ASC LIMIT 1 ;


SELECT t2.usu_nombre , t3.med_nombreCompleto , t1.cit_fecha FROM cita AS t1 
INNER JOIN usuarios AS t2 ON t1.cit_datosUsuario = t2.usu_id 
INNER JOIN medico AS t3 ON t1.cit_medico = t3.med_nroMatriculaProsional
WHERE t3.med_nroMatriculaProsional = 1345 AND t1.cit_estado = 1;
