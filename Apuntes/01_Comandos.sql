-- Comandos en transact SQL

	-- SELECT nos permite hacer llamadas a la base de datos. Deberemos especificar el/los campos (* para todos) y tras el FROM la tabla

SELECT idpaciente,nombre,apellido FROM paciente

	-- INSERT nos permite ingresar datos en una tabla. si hay un campo IDENTITY no hay que incluirlo ni en la definici�n de los campos ni en la cl�usula VALUE.

INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES ('33521569', 'Leandro', 'Paredes', '1982-05-20', 'Piedras 150', 'ARG', NULL, 'leandro@gmail.com', '')

	-- Si queremos a�adir m�s de un registro

INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES ('33578126', 'Jose', 'Perez', '1999-04-15', 'Lavalle 2563', 'COL', NULL, 'jose@gmail.com', 'paciente derivado')
,('20485781', 'Marcela', 'Torres', '1978-02-15', 'Belgrano 1563', 'MEX', '156847523', 'marcela@gmail.com', '')

SELECT * FROM Paciente  -- As� podremos visualizar toda la tabla

	-- UPDATE nos permite actualizar registros y campos en una tabla

UPDATE Paciente SET observacion = 'sin observacion'  -- Esto actualizar� TODOS los campos observaci�n de la tabla

UPDATE Paciente SET email = 'correo@mail' WHERE idPaciente = 2  -- Esto actualiza el email del paciente con idPaciente 2

UPDATE Paciente SET DNI = '458256965', domicilio = 'Calle 23' WHERE idPaciente = 2  -- Esto actualizar� varios campos del mismo paciente a la vez

	-- DELETE nos permite eliminar determinados registros de las tablas

DELETE FROM Paciente  -- Esto eliminar�a todos los registros de la tabla

DELETE FROM Paciente WHERE idPaciente = 6  -- Esto eliminar� todo el registro del paciente con idPaciente 6

		-- Hay que tener en cuenta las restricciones entre tablas a la hora de eliminar un registro ya que pueden no permitirnos hacerlo para no dejar registros inconsistentes

DELETE FROM Paciente WHERE idPaciente = 7  -- Al tener el idPaciente 7 un turno asignado no nos deja borrarlo arrojando un error con la restricci�n FK_TurnoPaciente_Paciente

		-- Para eliminarlo tendr�amos que realizar algunas acciones previas

DELETE FROM TurnoPaciente WHERE idPaciente = 7  -- Eliminamos todos los registros de ese paciente en la tabla TurnoPaciente (o podemos eliminar solo ese turno usando idTurno=9)
DELETE FROM Paciente WHERE idPaciente = 7  -- Ahora si podremos borrar el paciente, pero estas dos acciones habr�n dejado una inconsistencia en la base de datos
DELETE FROM Turno WHERE idTurno = 9  -- Esto solucionar�a la inconsistencia eliminando el turno que hemos tenido que borrar de TurnoPaciente para poder borrar el paciente

SELECT * FROM Paciente
SELECT * FROM TurnoPaciente
SELECT * FROM Turno