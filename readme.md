
# Sistema de citas

# Diagrama MER



![diagrama](https://raw.githubusercontent.com/Dannkol/actividadCitasNodejs/main/doc/diagrama.png)


# Consultas SQL



1. Obtener todos los pacientes alfabéticamente
   
2. Obtener todas las citas alfabéticamente
   
3. Obtener todos los médicos de una especialidad específica (por ejemplo, **'Cardiología'**):
   
4. Encontrar la próxima cita para un paciente específico (por ejemplo, el paciente con **usu_id 1**):
   
5. Encontrar todos los pacientes que tienen citas con un médico específico (por ejemplo, el médico con **med_nroMatriculaProsional 1**)
   
6. Obtener las consultorías para un paciente específico (por ejemplo, paciente **con usu_id 1**)
   
7. Encontrar todas las citas para un día específico (por ejemplo, **'2023-07-12'**)
   
8. Obtener los médicos y sus consultorios
   
9. Contar el número de citas que un médico tiene en un día específico (por ejemplo, el médico con **med_nroMatriculaProsional 1 en '2023-07-12'**)
   
10. Obtener los consultorio donde se aplicó las citas de un paciente
    
11. Obtener todas las citas realizadas por los pacientes de un genero si su estado de la cita fue atendidad
    
12. Insertar un paciente a la tabla usuario pero si es menor de edad solicitar primero que ingrese el acudiente y validar si ya estaba registrado el acudiente.
    
13. Mostrar todas las citas que fueron rechazadas y en un mes específico, mostrar la fecha de la cita, el nombre del usuario y el médico.
## Comandos usados

### Instalacion

comenzamos con las dependencias necesarios para este tuturial

* Node v18.16.1
* Npm 9.5.1
* Mysql
* Apache

### Iniciamos el proyecto

```shell
npm init -y
```

### Instalacion de dependencias

```shell
npm i -E --save express mysql2 sequelize class-transformer reflect-metadata
```

### Dependencias de desarrollo
```shell
npm i -E -D nodemon
```

## Configuracion inicial

Extructura de carpetas

```shell
C:.
├───db
├───doc
├───src
│   ├───config
│   ├───DTO
│   └───middleware
└───ts
```

#### database

La base de datos se encuentra en 

```shell
db/cita.sql
```

## API Reference

#### Get usuarios ordered by usu_nombre ascending

```http
  GET /pacientes
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `/` | `/` | `/`   | 


```json

{
  "mensaje": "Uusuarios ordered by usu_nombre ascending",
  "data": [
    {
      "usu_id": 2,
      "usu_nombre": "Abigail Zorr",
      "usu_segdo_apellido_usuar": "Gonzales",
      "usu_primer_apellido_usuar": "Cabalga",
      "usu_telefono": "+57231775955",
      "usu_direccion": "Carrera 18 - aqui no roban",
      "usu_e-mail": "bbcitaAbiprincess@correo.com",
      "usu_tipodoc": 1,
      "usu_genero": 2,
      "usu_acudiente": null
    },
    {
      "usu_id": 1,
      "usu_nombre": "German Aston",
      "usu_segdo_apellido_usuar": "Merida",
      "usu_primer_apellido_usuar": "Galagoz",
      "usu_telefono": "+57231818989",
      "usu_direccion": "Avenida tus abrazos",
      "usu_e-mail": "dartProGamer@correo.com",
      "usu_tipodoc": 1,
      "usu_genero": 4,
      "usu_acudiente": 2
    }
  ]
}

```

#### Get  citas ordered by cit_fecha DESC

```http
  GET /citas
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `/` | `/` | `/`   | 


```json

{
  "mensaje": "citas ordered by cit_fecha DESC",
  "data": [
    {
      "cit_codigo": 9,
      "cit_fecha": "2023-10-20T05:00:00.000Z",
      "cit_estado": 4,
      "cit_medico": 1345,
      "cit_datosUsuario": 2
    },
    {
      "cit_codigo": 8,
      "cit_fecha": "2023-10-13T05:00:00.000Z",
      "cit_estado": 4,
      "cit_medico": 12468,
      "cit_datosUsuario": 1
    },
    {
      "cit_codigo": 10,
      "cit_fecha": "2023-08-20T05:00:00.000Z",
      "cit_estado": 1,
      "cit_medico": 1234,
      "cit_datosUsuario": 2
    },
    {
      "cit_codigo": 7,
      "cit_fecha": "2023-08-13T05:00:00.000Z",
      "cit_estado": 1,
      "cit_medico": 12468,
      "cit_datosUsuario": 1
    },
    {
      "cit_codigo": 6,
      "cit_fecha": "2023-05-13T05:00:00.000Z",
      "cit_estado": 2,
      "cit_medico": 1234,
      "cit_datosUsuario": 1
    }
  ]
}

```


#### Get especialidades por medico

```http
  GET /medicos/:esp
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:esp` | `String` | **Required**   | 


```json

{
  "mensaje": "especialidades por medico",
  "data": [
    {
      "med_nombreCompleto": "Antonio Taquemas",
      "esp_nombre": "Oftalmologia"
    }
  ]
}

```

#### Get Citas de un usuario

```http
  GET /usuario/citas/:id
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `Number` | **Required**   | 


```json

{
  "mensaje": "Citas de un usuario",
  "data": [
    {
      "usu_nombre": "German Aston",
      "cit_fecha": "2023-08-13T05:00:00.000Z"
    }
  ]
}

```

#### Get medicos de un usuario

```http
  GET /usuario/medico/:id
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `Number` | **Required**   | 


```json

{
  "mensaje": "medicos de un usuario",
  "data": [
    {
      "usu_nombre": "Abigail Zorr",
      "med_nombreCompleto": "Antonio Taquemas",
      "cit_fecha": "2023-08-20T05:00:00.000Z"
    }
  ]
}

```

#### Get Consultorios de un usuario

```http
  GET /usuario/consultorio/:id
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `Number` | **Required**   | 


```json

{
  "mensaje": "Consultorios de un usuario",
  "data": [
    {
      "usu_nombre": "German Aston",
      "med_nombreCompleto": "Antonio Taquemas",
      "cit_fecha": "2023-05-13T05:00:00.000Z",
      "cons_nombre": "Paso al infierno"
    },
    {
      "usu_nombre": "German Aston",
      "med_nombreCompleto": "Mr Zulander",
      "cit_fecha": "2023-08-13T05:00:00.000Z",
      "cons_nombre": "Mi primera uci"
    },
    {
      "usu_nombre": "German Aston",
      "med_nombreCompleto": "Mr Zulander",
      "cit_fecha": "2023-10-13T05:00:00.000Z",
      "cons_nombre": "Mi primera uci"
    }
  ]
}

```

#### Get citas por fecha

```http
  GET /citas/fecha/:date
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:date` | `Date` | **Required**   | 


```json

{
  "mensaje": "citas por fecha",
  "data": [
    {
      "usu_nombre": "German Aston",
      "cit_fecha": "2023-08-13T05:00:00.000Z"
    }
  ]
}

```

#### Get todos los medicos y sus consultorios

```http
  GET /medico/consultorio
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `/` | `/` | `/`   | 


```json

{
  "mensaje": "todos los medicos y sus consultorios",
  "data": [
    {
      "med_nombreCompleto": "Antonio Taquemas",
      "cons_nombre": "Paso al infierno"
    },
    {
      "med_nombreCompleto": "Antonio Taquemas",
      "cons_nombre": "Paso al infierno"
    },
    {
      "med_nombreCompleto": "Mr Zulander",
      "cons_nombre": "Mi primera uci"
    },
    {
      "med_nombreCompleto": "Mr Zulander",
      "cons_nombre": "Mi primera uci"
    },
    {
      "med_nombreCompleto": "Esteban Quito",
      "cons_nombre": "Adios Amigos"
    }
  ]
}

```

#### Get cantidad de Citas

```http
  GET /medico/:id/citas/:date
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `Number` | **Required**   |
| `:date` | `Date` | **Required**   | 



```json

{
  "mensaje": "cantidad de Citas",
  "data": [
    {
      "Cantidad_citas": 1
    }
  ]
}

```

#### Get Citas finalizadas o canceladas por usuario

```http
  GET /usuarios/finalizado/consultorio/:id
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `Number` | **Required**   |


```json

{
  "mensaje": "Citas finalizadas o canceladas por usuario",
  "data": [
    {
      "fecha": "2023-05-13T05:00:00.000Z",
      "nombre": "Paso al infierno",
      "usuario": "German Aston"
    },
    {
      "fecha": "2023-10-13T05:00:00.000Z",
      "nombre": "Mi primera uci",
      "usuario": "German Aston"
    }
  ]
}

```

#### Get Usuario por genero

```http
  GET /usuarios/genero/:id
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `String` | **Required**   |


```json

{
  "mensaje": "Usuario por genero",
  "data": [
    {
      "fecha": "2023-08-20T05:00:00.000Z",
      "consultorio": "Paso al infierno",
      "nombre": "Abigail Zorr",
      "genero": "Femenino"
    }
  ]
}

```

#### Get Citas en un mes

```http
  GET /canceladas/mes/:id/year/:year
```

| Parameter | Type     | Description |
| :-------- | :------- | :---------- |
| `:id` | `Number` | **Required**   |
| `:year` | `Number` | **Required**   |


```json

{
  "mensaje": "Citas en el mes 10 del año 2023",
  "data": [
    {
      "paciente": "German Aston",
      "fecha": "2023-10-13T05:00:00.000Z",
      "medico": "Mr Zulander"
    },
    {
      "paciente": "Abigail Zorr",
      "fecha": "2023-10-20T05:00:00.000Z",
      "medico": "Esteban Quito"
    }
  ]
}

```

## 🛠 Tecnologias
PHP, HTML, CSS, Apache2


## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://dannkol.github.io/portafolios/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/daniel-manosalva-000b98242)

