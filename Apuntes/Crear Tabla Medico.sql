-- Creando la tabla pagos

CREATE TABLE Medico (
	idMedico int IDENTITY (1,1) NOT NULL PRIMARY KEY, --Establecemos que es la primary key y activamos la función identity (que avance de 1 en 1, que comience desde el 1)
	nombre varchar(50) NOT NULL,
	apellido varchar(50) NOT NULL,

)

-- Tras pulsar F5 y si no arroja ningún error podremos comprobar visualizar la tabla dando a refresh de la carpeta Tables