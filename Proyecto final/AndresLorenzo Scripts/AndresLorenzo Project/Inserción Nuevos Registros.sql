-- Insertando nuevos registros

	-- Tabla HoraCaptacion

INSERT INTO HoraCaptacion (FechaCaptacion, EstadoCaptacion, Observaciones)
VALUES ('2024-01-01', 1, 'DESCONOCIDO');  -- No se puede asignar un valor tipo DATETIME a un DATE por lo que se recorta la hora. Para añadirla habría que cambiar el tipo de dato de la tabla

	-- Tabla HoraCapClienteCampaña
	
INSERT INTO HoraCapClienteCampania (idHCaptacion, IdCliente, IdCampania)
VALUES (@@IDENTITY, 4, 1);		-- En una base de datos más complicada y con más usuarios trabajando en ella se debería utilizar SCOPE_IDENTITY()

/* Con SCOPE_IDENTITY()

DECLARE @identidad INT

INSERT INTO HoraCaptacion (FechaCaptacion, EstadoCaptacion, Observaciones)
VALUES ('2024-01-01', 1, 'DESCONOCIDO');  -- No se puede asignar un valor tipo DATETIME a un DATE por lo que se recorta la hora. Para añadirla habría que cambiar el tipo de dato de la tabla

SET @identidad = SCOPE_IDENTITY();
	
INSERT INTO HoraCapClienteCampania (idHCaptacion, IdCliente, IdCampania)
VALUES (@identidad, 4, 1);

*/