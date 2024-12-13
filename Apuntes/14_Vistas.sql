-- Vistas en SQL

/*
  Lo que hacen las vistas es almacenar una consulta en la base de datos de forma local y cuando ejecutamos la vista lo que hace es actualizarse y devolvernos los 
  datos actualizados. Lo que hace SQL internamente es guardar una copia de esa consulta para que el resultado sea m�s r�pido a la hora de acceder a esos datos. 

  Una vista en SQL es una tabla virtual que se deriva de una o m�s tablas existentes en una base de datos. En lugar de almacenar los datos f�sicamente, una vista es 
  una consulta predefinida que se puede utilizar para recuperar los datos de una o m�s tablas en una base de datos.

  Una vista se crea mediante una instrucci�n SELECT y puede contener cualquier cl�usula v�lida de SQL, como WHERE, GROUP BY, ORDER BY y JOIN. 
  Una vez creada la vista, se puede consultar como si fuera una tabla real, lo que significa que se pueden realizar consultas y aplicar filtros, y los resultados se 
  devolver�n como si se hubieran consultado directamente desde una tabla.

  Las vistas son �tiles en situaciones en las que se requiere una consulta frecuente de una misma tabla o combinaci�n de tablas, ya que pueden simplificar la consulta 
  y reducir la complejidad de las consultas que se ejecutan con frecuencia. Tambi�n se pueden utilizar para restringir el acceso a datos confidenciales o para proporcionar 
  una capa adicional de seguridad en una base de datos.
*/

	-- Creamos una vista que sea una consulta que almacena los pacientes y los turnos pendientes

CREATE VIEW PacientesTurnosPendientes AS								-- Creamos una vista llamada PacientesTurnosPendientes
	SELECT P.idPaciente, P.nombre, P.apellido, T.idTurno, T.estado		-- Realizamos una b�squeda que nos muestre los campos indicados de las tablas Paciente y Turno
		FROM Paciente P													
		INNER JOIN TurnoPaciente TP										-- Conectamos las tablas Paciente (alias P) con Turnopaciente (alias TP)
		ON TP.idPaciente = P.idPaciente									-- Indicamos que la relaci�n es a trav�s de idPaciente
		INNER JOIN Turno T												-- Conectamos tambi�n la tabla Turno (alias T)
		ON T.idTurno = TP.idTurno										-- Indicamos que la relaci�n es a trav�s de idTurno
	WHERE ISNULL (T.estado,0) = 0										-- Filtramos que solo nos muestre aquellos que tienen el estado pendiente (estado=0)
	
		/* 
		   Ahora solo tendremos que ir en el Object Explorer a la base de datos/Views y podremos visualizarla o acceder a la vista de dise�o (con click derecho/Design). 
		   Desde esa misma carpeta con click derecho/New View podremos crear vistas desde la interfaz gr�fica
		*/

		-- El tratamiento que se le da a una vista una vez creada es el mismo que si fuese una tabla 

SELECT * FROM PacientesTurnosPendientes
			
			/*
			   Al igual que con cualquier otra tabla podremos realizar sobre ella b�squedas, JOINS con otras tablas, ordenarla, etc.
			*/