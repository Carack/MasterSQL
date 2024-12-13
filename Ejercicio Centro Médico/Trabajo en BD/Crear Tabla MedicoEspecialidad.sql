--Creando la tabla MedicoEspecialidad

CREATE TABLE MedicoEspecialidad (
	idMedico int NOT NULL,
	idEspecialidad int NOT NULL,
	descripcion varchar(50) NULL,
 CONSTRAINT PK_MedicoEspecialidad PRIMARY KEY CLUSTERED --Le damos un nombre a la clave compuesta y creamos un índice clustered (que organiza los datos físicamente en disco según el orden especificado)
(
	idMedico ASC,			--Especificamos orden ascendente (con DESC sería descendente) para organizar los datos
	idEspecialidad ASC
))
