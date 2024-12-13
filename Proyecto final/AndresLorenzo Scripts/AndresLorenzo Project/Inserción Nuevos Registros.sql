-- Insertando nuevos registros

	-- Tabla HoraCaptacion

INSERT INTO HoraCaptacion (FechaCaptacion, EstadoCaptacion, Observaciones)
VALUES ('2024-01-01', 1, 'DESCONOCIDO');  -- No se puede asignar un valor tipo DATETIME a un DATE por lo que se recorta la hora. Para a�adirla habr�a que cambiar el tipo de dato de la tabla

	-- Tabla HoraCapClienteCampa�a
	
INSERT INTO HoraCapClienteCampania (idHCaptacion, IdCliente, IdCampania)
VALUES (@@IDENTITY, 4, 1);		-- En una base de datos m�s complicada y con m�s usuarios trabajando en ella se deber�a utilizar SCOPE_IDENTITY()

/* Con SCOPE_IDENTITY()

DECLARE @identidad INT

INSERT INTO HoraCaptacion (FechaCaptacion, EstadoCaptacion, Observaciones)
VALUES ('2024-01-01', 1, 'DESCONOCIDO');  -- No se puede asignar un valor tipo DATETIME a un DATE por lo que se recorta la hora. Para a�adirla habr�a que cambiar el tipo de dato de la tabla

SET @identidad = SCOPE_IDENTITY();
	
INSERT INTO HoraCapClienteCampania (idHCaptacion, IdCliente, IdCampania)
VALUES (@identidad, 4, 1);

*/