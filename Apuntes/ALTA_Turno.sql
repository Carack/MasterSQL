-- Creando el Stored Procedure para añadir Turnos
	-- Recuerda que en caso de crearlo y necesirar modificarlo en lugar de CREATE utilizaríamos ALTER

/*
SELECT * FROM Turno
SELECT * FROM Paciente
SELECT * FROM TurnoPaciente
SELECT * FROM Medico
*/

-- Así es como realizaríamos una llamada al SP
-- EXEC ALTA_Turno '20190218 09:15', 6, 1, 'Ninguna'


CREATE PROC ALTA_Turno(              -- En caso de necesitar editar el SP usar ALTER en lugar de CREATE
			@fecha CHAR(14),		 -- aaaammdd hh:mm
			@idpaciente paciente,   -- Usamos el tipo de dato de usuario definido para este campo
			@idmedico medico,		-- Usamos el tipo de dato de usuario definido para este campo
			@observacion observacion = ''  -- Usamos el tipo de dato de usuario definido para este campo
			)
AS

/*
ESTADO = 0 (pendiente)
ESTADO = 1 (realizado)
ESTADO = 2 (cancelado)
*/

SET NOCOUNT ON   -- Para que cuando hagamos el INSERT no nos diga los registros afectados

IF NOT EXISTS (SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno = @fecha)  -- Comprobamos que no exista otro turno con la misma fecha exacta
BEGIN 
	INSERT INTO Turno (fechaTurno, estado, observacion)
	VALUES (@fecha, 0, @observacion)

	DECLARE @auxIDturno turno
	SET @auxIDturno = @@IDENTITY      -- Con esto asignamos a la variable el último campo IDENTITY generado. Como acabamos de crear un Turno en este caso será el idTurno

	INSERT INTO TurnoPaciente (idTurno, idPaciente, idMedico)
	VALUES (@auxIDturno, @idpaciente, @idmedico)
	PRINT 'El turno se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El turno ya existe'
	RETURN
END