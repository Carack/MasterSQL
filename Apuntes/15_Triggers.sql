-- Triggers en SQL

/*
  Es un disparador de un evento. 
  Tenemos 3 tipos de eventos que pueden disparar un trigger: cuando se insertan, se actualizan o se borran datos de una tabla.
  Al ocurrir cualquiera de estos eventos vamos a poder tomar acciones como almacenar un registro de log, cargar datos en otra tabla, emitir alertas...
  Nos permiten monitorizar estos eventos para poder tomar decisiones en relación a la información que se modificó de esa tabla. 
*/

	-- Creación de un TRIGGER tipo INSERT

		-- Creamos un TRIGGER que almacene un LOG si el Paciente que se ingresa en la base de datos es perteneciente, por ejemplo, al Pais Mexico
				
				-- Para visualizar el LOG
					
					/* 
					  Ingresamos un paciente gracias al script ALTA_Paciente:
						EXEC ALTA_Paciente '5123654','Hector','Ramallo','20100115','calle 321','MEX','','Ramallito@gmail.com',''
					  Y visualizamos el LOG: 
						SELECT * FROM PacienteLog
					*/

CREATE TRIGGER PacientesCreados ON Paciente							-- Creamos el TRIGGER llamado PacientesCreados
AFTER INSERT														-- para que se dispare ante las inserciones que se produzcan en la tabla Paciente
AS
IF (SELECT idPais FROM inserted) = 'MEX'							-- Comprobamos si el último registro insertado tiene un idPais='MEX'
	INSERT INTO PacienteLog (idPaciente, idPais, fechaAlta)			-- Si es correcto insertamos en la tabla PAcienteLog 
		SELECT i.idPaciente, i.idPais, GETDATE() FROM inserted i	-- Él último idPaciente, isPais insertado y la fecha actual local (que será la de alta)

	-- Creación de un TRIGGER tipo UPDATE

		-- Creamos un TRIGGER que almacene un LOG si se modifica un paciente de la tabla Paciente
				
				-- Para visualizar el LOG
					
					/* 
					  Creamos un campo en la tabla PacienteLog que almacene la fecha de actualización del registro:
						ALTER TABLE PacienteLog ADD fechaModificacion DATETIME
					  Modificamos un paciente :
						UPDATE Paciente SET telefono = '616778899' WHERE idPaciente = 7
					  Y visualizamos el LOG: 
						SELECT * FROM PacienteLog
					*/

CREATE TRIGGER PacientesModificados ON Paciente						-- Creamos el TRIGGER llamado PacientesModificados
AFTER UPDATE														-- para que se dispare ante las actualizaciones que se produzcan en la tabla Paciente
AS
IF EXISTS(SELECT idPaciente FROM PacienteLog                        -- Comprobamos si ya existe ese idPaciente en PacienteLog
		  WHERE idPaciente = (SELECT idPaciente From inserted)		-- donde idPaciente sea igual a el último idPaciente insertado o actualizado mediante UPDATE
		 )
	UPDATE PacienteLog SET fechaModificacion = GETDATE()			-- Si es correcto actualizamos la fechaModificación con la fecha local actual
	WHERE idPaciente = (SELECT idPaciente From inserted)			-- Donde idPaciente sea igual a el útimo paciente insertado o actualizado
ELSE																-- Si no
	INSERT INTO PacienteLog (idPaciente, idPais, fechaModificacion)	-- Insertamos en el LOG
	SELECT idPaciente, idPais, GETDATE() FROM inserted				-- El último idPaciente e idPais insertado o actualizado y la fecha actual local

	-- Creación de un TRIGGER tipo DELETE

		-- Creamos un TRIGGER que almacene un LOG si se elimina un paciente de la tabla Paciente
				
				-- Para visualizar el LOG
					
					/* 
					  Creamos un campo en la tabla PacienteLog que almacene la fecha de eliminación del registro:
						ALTER TABLE PacienteLog ADD fechaBaja DATETIME
					  Ingresamos un paciente de prueba gracias al script ALTA_Paciente:
						EXEC ALTA_Paciente '1236549','Juana','Flores','19891201','Avenida 31','MEX','','Floritura@gmail.com',''
						SELECT * FROM Paciente
					  Eliminamos al paciente de pruebas:
						DELETE FROM Paciente WHERE dni = '1236549'
					  Y visualizamos el LOG: 
						SELECT * FROM PacienteLog
					*/

CREATE TRIGGER PacientesEliminados ON Paciente						-- Creamos el TRIGGER llamado PacientesEliminados
FOR DELETE															-- para que se dispare cuando se borre un registro en la tabla Paciente
AS
IF EXISTS(SELECT idPaciente FROM PacienteLog                        -- Comprobamos si ya existe ese idPaciente en PacienteLog
		  WHERE idPaciente = (SELECT idPaciente From deleted)		-- donde idPaciente sea igual a el último idPaciente eliminado de la tabla
		 )
	UPDATE PacienteLog SET fechaBaja = GETDATE()					-- Si es correcto actualizamos la fechabaja con la fecha local actual
	WHERE idPaciente = (SELECT idPaciente From deleted)				-- Donde idPaciente sea igual a el útimo paciente borrado
ELSE																-- Si no
	INSERT INTO PacienteLog (idPaciente, idPais, fechaBaja)			-- Insertamos en el LOG
	SELECT idPaciente, idPais, GETDATE() FROM deleted				-- El último idPaciente e idPais borrado y la fecha actual local

