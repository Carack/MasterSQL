--Creando la tabla MedicoEspecialidad

CREATE TABLE MedicoEspecialidad (
	idMedico int NOT NULL,
	idEspecialidad int NOT NULL,
	descripcion varchar(50) NULL,
 CONSTRAINT PK_MedicoEspecialidad PRIMARY KEY CLUSTERED --Le damos un nombre a la clave compuesta y creamos un �ndice clustered (que organiza los datos f�sicamente en disco seg�n el orden especificado)
(
	idMedico ASC,			--Especificamos orden ascendente (con DESC ser�a descendente) para organizar los datos
	idEspecialidad ASC
))
