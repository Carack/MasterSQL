-- Insertando datos iniciales

		-- Tabla Pais. Esta inserción debe hacerse primero o pueden provocarse errores de inserción en otras tablas por FK como por ejemplo en Cliente

INSERT INTO Pais (IdPais, NombrePais)
VALUES 
    ('ESP', 'España'),
	('GRC', 'Grecia'),
	('IND', 'India'),
	('USA', 'Estados Unidos'),
    ('MEX', 'México'),
	('BRA', 'Brasil'),
	('DEU', 'Alemania');
	
	-- Tabla Cliente

INSERT INTO Cliente (Nombre, Apellido, Fnacimiento, Domicilio, idPais, Telefono, Email, Observaciones, FechaAlta)
VALUES
	('Raúl', 'González', '1986-05-25', 'Gualtatas 2526', 'ESP', '664859632', 'donraul@gmail.es', 'No hay observaciones' ,'2024-01-05 00:00:00.000'),
	('James', 'Nicole', '1990-03-02', 'O´niell jack 2568', 'USA', '1254685632', 'wuarden@green.us', 'No hay observaciones' ,'2024-01-06 00:01:00.000'),
	('Marta', 'Perez', '1995-05-03', 'Brasilia 25', 'BRA', '56432253', 'mPerezbra@getmail.com', 'No hay observaciones' ,'2024-02-01 00:00:00.000'),
	('Claudio', 'Ramirez', '1984-08-02', 'Cheguan 225', 'ESP', '66852125', 'clauRami@gmail.es', 'No hay observaciones' ,'2024-02-01 00:02:02.000'),
	('Markuis', 'Papadopulus', '1982-02-06', 'Grikindier 223', 'GRC', '2548542355', 'papadopulusm@gmail.com', 'Es griego' ,'2024-02-01 00:06:00.000'),
	('Carlos', 'Trebor', '1966-05-03', 'Pedro Pastor 2', 'MEX', '135852133', 'Carlitos@gmail.ue', 'No hay observaciones' ,'2024-02-01 00:00:00.000'),
	('Otto', 'Von Kunstmann', '1975-09-01', 'Ötiggen str 3', 'DEU', '6582216335', 'elaleman@aleman.com', 'Es Alemán' ,'2024-02-01 00:08:00.000'),
	('Uit', 'Tlinnlnie', '1977-05-05', 'Intrati 22', 'IND', '1325865523', 'uit@guit.in', 'Es Indio' ,'2024-02-06 00:00:00.000');


	-- Tabla HorarioEstado. Pasa lo mismo que con País. Puede ocasionar errores con la FK_HoraCaptacion_HorarioEstado

INSERT INTO HorarioEstado (Descripcion)
VALUES
    ('Prime tarde-noche'), 
	('Valle Media tarde, media mañana'),
    ('Breakfast antes de las 10 AM'),    
    ('Nocturno después de las 00:00');   

	
	-- Tabla HoraCaptacion

INSERT INTO HoraCaptacion (FechaCaptacion, EstadoCaptacion, Observaciones)
VALUES 
    ('2024-01-05', 1, 'Lead'),
	('2024-01-05', 2, 'Lead'),
	('2024-02-01', 1, 'Cliente'),
	('2024-02-01', 3, 'Prospecto'),
    ('2024-02-01', 1, 'Lead');

	-- Tabla Campania

INSERT INTO Campania (NombreCampaña)
VALUES 
    ('Producto Estrella 1'),
	('Producto Estrella 2'),
    ('Producto Estrella 3');

	-- Tabla ConceptoCompra

INSERT INTO ConceptoCompra (Concepto)
VALUES
    ('Compra producto Estrella 1'),
    ('Compra producto Estrella 2'),
    ('Compra producto Estrella 3');


	-- Tabla Compra

INSERT INTO Compra (Concepto, Fecha, Monto, Observaciones)
VALUES 
    (1, '2024-11-05 10:00:00', 5000.0000, 'Comprador de producto estrella 1'),
	(2, '2024-11-05 10:00:00', 3500.0000, 'Comprador de producto estrella 2'),
    (3, '2024-11-06 12:30:00', 5000.0000, 'Comprador de producto estrella 1');

	-- Tabla CompraCliente. Ya que son IDs generadas de forma automática se añadirán valores con correspondencia según los insertados anteriormente

INSERT INTO CompraCliente (IdCompras, IdCliente, idHCaptacion)
VALUES 
    (1, 8, 2),
	(2, 5, 4),
    (3, 2, 5);  