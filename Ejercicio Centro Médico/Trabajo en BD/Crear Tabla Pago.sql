-- Creando la tabla pagos

CREATE TABLE Pago (
	idPago int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	concepto tinyint NOT NULL,
	fecha datetime NOT NULL,
	monto money NOT NULL,
	estado tinyint,
	obs varchar(1000)
)

-- Tras pulsar F5 y si no arroja ningún error podremos comprobar visualizar la tabla dando a refresh de la carpeta Tables

