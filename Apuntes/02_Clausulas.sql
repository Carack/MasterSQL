-- Uso de las cl�usulas en transact SQL

	-- La clausula TOP muestra tantos registros como el n�mero que le acompa�e empezando desde el primero

SELECT TOP 2 nombre,apellido FROM Paciente

	-- La clausula ORDER BY ordena la salida de un SELECT por el campo que se le a�ada a continuaci�n de manera ASC/DESC (de manera ascendente por defecto si no se pone nada)

SELECT * FROM Paciente ORDER BY fNacimiento DESC

		-- Podemos combinar TOP y ORDER BY para obtener una consulta m�s avanzada

SELECT TOP 1 * FROM Paciente ORDER BY fNacimiento DESC  -- Esto retornar� al paciente (un solo registro) con la fecha de nacimiento m�s reciente (el m�s joven)

	-- La clausula DISTINCT nos devuelve un grupo de valores agrupados por un mismo valor. Registros distintos seg�n el campo especificado. 

SELECT DISTINCT idPais FROM Paciente --Nos devolver� los valores unitarios distintos prersentes en esa columna (sin repeticiones)

	-- La clausula GROUP BY agrupa los valores de determinado campo (similar a DISTINCT) pero permite el uso de algunas funciones adicionales como aplicarle funciones

SELECT idPais FROM Paciente GROUP BY idPais

	-- La clausula WHERE nos permite filtrar determinados registros por determinados valores en ciertos campos

SELECT * FROM Paciente WHERE idPais = 'COL'
SELECT * FROM Paciente WHERE apellido = 'Perez'
SELECT * FROM Paciente WHERE idPaciente = 4
SELECT * FROM Paciente WHERE fNacimiento = '20190118'
SELECT * FROM Paciente WHERE fNacimiento = '2019-01-18'

	-- La clausula JOIN nos permite cruzar tablas por campos que tengan en com�n para tener un resultado m�s amplio (que involucre a ambas tablas) 
	-- Consta de 3 tipos: INNER JOIN, LEFT JOIN y RIGHT JOIN

		-- INNER JOIN nos permite obtener todos los registros de ambas tablas que comparten el campo en com�n

SELECT * FROM Paciente						-- Previsualizamos las tablas con las que vamos a trabajar
SELECT * FROM TurnoPaciente

SELECT * FROM Paciente P					-- Asignamos el alias P a la tabla Paciente
INNER JOIN TurnoPaciente T					-- Invocamos el INNER JOIN d�ndole T como alias a TurnoPaciente
ON T.idPaciente = P.idPaciente				-- Cruzamos los campos de ambas tablas referenciando a cual pertenecen gracias a los alias

		-- LEFT JOIN nos permite obtener los todos registros de la tabla de la izquierda (la primera en el SELECT) y los que coincidan con la cl�usula ON de la derecha dejando
		-- en NULL el resto de valores que no coincidan

SELECT * FROM Paciente P					-- Asignamos el alias P a la tabla Paciente
LEFT JOIN TurnoPaciente T					-- Invocamos el LEFT JOIN d�ndole T como alias a TurnoPaciente
ON T.idPaciente = P.idPaciente				-- Cruzamos los campos de ambas tablas referenciando a cual pertenecen gracias a los alias

		-- RIGHT JOIN nos permite obtener los todos registros de la tabla de la derecha (la indicada tras RIGHT JOIN) y SOLO los que coincidan con la cl�usula ON de la izquierda

SELECT * FROM Paciente P					-- Asignamos el alias P a la tabla Paciente
RIGHT JOIN TurnoPaciente T					-- Invocamos el RIGHT JOIN d�ndole T como alias a TurnoPaciente
ON T.idPaciente = P.idPaciente				-- Cruzamos los campos de ambas tablas referenciando a cual pertenecen gracias a los alias

		/* 
		  Consideraciones a tener en cuenta cuando trabajamos con JOIN
		    - Cuando realizamos un INNER JOIN con tablas debemos cerciorarnos de que estamos realizando la conexi�n SIEMPRE por la Primary KEY
			  - Puede hacerse por otros campos, pero es mucho m�s eficiente y r�pido realizarlo por las PK
			- La primera tabla en ser referenciada tras el ON DEBE ser la siguiente al JOIN (la tabla inmediata por la que se hace la conexi�n)
			  - Puede hacerse al rev�s, pero SQL ser� m�s eficiente y r�pido a la hora de resolver la consulta siguiendo la consideraci�n anterior
			- Utilizar SIEMPRE alias de tablas para evitar problemas de ambig�edad de campos
			  - Pueden no utilizarse pero habr�a que referenciar el nombre completo de la tabla (Paciente.idPaciente) para que no provoque errores y con un alias es m�s c�modo y r�pido
		*/

		-- Las cl�usulas UNION y UNION ALL nos permiten unir resultados de consultas
			-- La diferencia principal entre UNION e INNER es que UNION nos permite unir dos resultados de dos consultas diferentes
			-- UNION tambi�n elimina las repeticiones entre registros

SELECT * FROM Turno WHERE estado = 1
UNION										-- Une los resultados de ambas consultas mostr�ndolos en el orden en el que se solicitan
SELECT * FROM Turno WHERE estado = 0

			-- UNION requiere que ambas tablas contengan los mismos campos con los mismos tipos de datos

SELECT * FROM Turno WHERE estado = 1
UNION										-- Esto provoca un error ya que las estructuras de ambas tablas son diferentes
SELECT * FROM Paciente

			-- Podemos utilizarlo para agrupar en una misma columna datos de un campo que sean del mismo tipo aunque no pertenezcan a la misma tabla ni est�n referenciados
				-- La columna a mostrar recibir� el nombre del dato solicitado en el primer SELECT

SELECT idTurno FROM Turno WHERE estado = 1
UNION										-- Al ser el mismo tipo de dato, los unir� aunque no hagan referencia al mismo dato
SELECT idPaciente FROM Paciente

			-- Con UNION ALL obtenemos lo mismo que con UNION pero sin eliminar las repeticiones entre registros

SELECT * FROM Turno
UNION ALL										-- Mostrar� los registros por duplicado ya que es la misma consulta mientras que con solo UNION eliminar�a duplicados
SELECT * FROM Turno
