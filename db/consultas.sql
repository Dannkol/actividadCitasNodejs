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


SELECT t2.usu_nombre , t3.med_nombreCompleto , t1.cit_fecha , t4.cons_nombre FROM cita AS t1 
INNER JOIN usuarios AS t2 ON t1.cit_datosUsuario = t2.usu_id 
INNER JOIN medico AS t3 ON t1.cit_medico = t3.med_nroMatriculaProsional
INNER JOIN consultorio AS t4 ON t3.med_consultorio = t4.cons_codigo
WHERE t2.usu_id = 1;


SELECT t2.usu_nombre, t1.cit_fecha FROM cita AS t1 
INNER JOIN usuarios AS t2 ON t1.cit_datosUsuario = t2.usu_id WHERE t1.cit_fecha = '2023-08-13'
ORDER BY t1.cit_fecha ASC;


SELECT t3.med_nombreCompleto , t4.cons_nombre FROM cita AS t1 
INNER JOIN medico AS t3 ON t1.cit_medico = t3.med_nroMatriculaProsional
INNER JOIN consultorio AS t4 ON t3.med_consultorio = t4.cons_codigo;


SELECT COUNT(t3.med_nombreCompleto) FROM cita AS t1 
INNER JOIN medico AS t3 ON t1.cit_medico = t3.med_nroMatriculaProsional
INNER JOIN consultorio AS t4 ON t3.med_consultorio = t4.cons_codigo
WHERE t1.cit_fecha = '2023-08-13' AND t3.med_nroMatriculaProsional = 1345;


SELECT t1.cit_fecha as "fecha" , t4.cons_nombre as "consultorio", t2.usu_nombre as "nombre", t5.gen_nombre as "genero" FROM cita AS t1 
INNER JOIN usuarios AS t2 ON t1.cit_datosUsuario = t2.usu_id 
INNER JOIN medico AS t3 ON t1.cit_medico = t3.med_nroMatriculaProsional
INNER JOIN consultorio AS t4 ON t3.med_consultorio = t4.cons_codigo
INNER JOIN genero AS t5 ON t5.gen_id = t2.usu_genero
WHERE t2.usu_genero = 4 AND t1.cit_estado = 1;
