-- Transacciones en SQL

	/* 
	   Las transacciones pueden realizarse en un script o dentro de un Stored Procedure.
	   Nos permiten ejecutar un bloque de c�digo y realizar un COMMIT o un ROLLBACK seg�n el resultado
	   Normalmente se utilizan para evaluar una porci�n de c�digo en la que estamos actualizando, insertando o borrando datos. 
	   Podemos utilizar la palabra reservada TRANSACTION o su abreviatura TRAN
	*/

	-- Ejemplo: Vamos a actualizar un tel�fono en la tabla Paciente para un idPaciente concreto

SELECT * FROM Paciente											-- Previsualizamos la tabla en la que vamos a trabajar

BEGIN TRANSACTION 
	UPDATE Paciente SET telefono = 444 WHERE idPaciente = 5		-- En el momento en el que trabajamos en una tabla esta queda bloqueada (en espera) hasta que se realice un COMMIT o un ROLLBACK
IF @@ROWCOUNT = 1												-- @@ROWCOUNT nos devuelve cuantos registros fueron modificados en la instrucci�n anterior
	COMMIT TRANSACTION											-- Confirmamos que se realice el bloque BEGIN sobre la base de datos
ELSE															-- Si la condici�n no se cumple (en este caso si se ha actualizado m�s de un registro o ninguno)
	ROLLBACK TRANSACTION										-- Cancelamos la realizaci�n del bloque BEGIN sobre la base de datos

	-- Ejemplo 2: Vamos a eliminar un turno de la tabla Turno para un estado concreto. Solo lo eliminaremos en el caso en el que el estado sea unitario

SELECT * FROM Turno												-- Previsualizamos la tabla en la que vamos a trabajar

BEGIN TRAN														-- En este caso utilizaremos la abreviatura TRAN
	DELETE FROM Turno WHERE estado = 0
IF @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN												-- En este caso se realizar�a un ROLLBACK y no se borrar�a nada de la tabla ya que tenemos m�s de un estado = 0
