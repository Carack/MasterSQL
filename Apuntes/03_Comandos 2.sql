-- Otros comandos 

-- El comando UPDATE nos permite actualizar registros y campos en una tabla

UPDATE Paciente SET observacion = 'sin observacion'  -- Esto actualizar� TODOS los campos observaci�n de la tabla

UPDATE Paciente SET email = 'correo@mail' WHERE idPaciente = 2  -- Esto actualiza el email del paciente con idPaciente 2

UPDATE Paciente SET DNI = '458256965', domicilio = 'Calle 23' WHERE idPaciente = 2  -- Esto actualizar� varios campos del mismo paciente a la vez

-- El comando DELETE nos permite eliminar determinados registros de las tablas

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
