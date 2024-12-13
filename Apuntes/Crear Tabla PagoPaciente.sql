-- Creando la tabla PagoPaciente

CREATE TABLE PagoPaciente (
	idPago int NOT NULL,
	idPaciente int NOT NULL,
	idTurno int NOT NULL

	PRIMARY KEY (idPago, idPaciente, idTurno)  --Creamos una primary key compartida
)

-- Tras pulsar F5 y si no arroja ningún error podremos comprobar visualizar la tabla dando a refresh de la carpeta Tables