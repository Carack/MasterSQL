-- Creando consultas sobre la base de datos

	-- 1. Una consulta “SELECT” que llame a la tabla Cliente y te muestre su contenido

SELECT * FROM Cliente;

	-- 2. Una consulta “SELECT” que te muestre solo los nombres de los clientes

SELECT Nombre FROM Cliente;

	-- 3. Una consulta que muestre los 3 primeros registros (TOP N) de la tabla Cliente y que los ordene por fecha de nacimiento de forma ascendente

SELECT TOP 3 * FROM CLIENTE ORDER BY Fnacimiento ASC;

	-- 4. Una consulta que muestre los idPais distintos por Cliente

SELECT DISTINCT idPais FROM Cliente;

	-- 5. Una sentencia que modifique el Email del primer registro de tu tabla de clientes. El nuevo Email es 200@gmail.es Utiliza UPDATE…..SET……WHERE…..

UPDATE Cliente SET Email = '200@gmail.es' WHERE IdCliente = (SELECT MIN(IdCliente) FROM Cliente); 

-- UPDATE Cliente SET Email = '200@gmail.es' WHERE IdCliente = (SELECT TOP 1 IdCliente FROM Cliente ORDER BY IdCliente ASC);  -- Alternativa 

	-- 6. Un promedio del campo monto de la tabla Compra

SELECT AVG(Monto) AS Promedio FROM Compra;

	-- 7. Una consulta que te muestre los datos de la tabla HoraCaptacion filtrados por fechas entre el 2024-01-01 y el 2024-01-30 Debes utilizar el operador BETWEEN

SELECT * FROM HoraCaptacion WHERE FechaCaptacion BETWEEN '2024-01-01'AND'2024-01-30';

	--	8. Una consulta if que te devuelva los registros de nacionalidad española de la tabla Cliente

IF EXISTS (SELECT 1 FROM Cliente WHERE idPais = 'ESP')  -- Como no podemos utilizar el IF para filtrar en la tabla cliente (para eso está el WHERE) lo utilizamos para saber si al menos existe un registro que tenga nacionalidad española
BEGIN
    SELECT * FROM Cliente WHERE idPais = 'ESP';
END
ELSE
BEGIN
    PRINT 'No hay clientes de nacionalidad española.';
END

	-- 9. Una consulta “CONDICIONAL CASE” que te devuelva un campo llamado continente con los continentes de los países de la tabla Pais

SELECT IdPais, NombrePais,  -- El ejercicio es poco claro, en caso de solo querer mostrar la nueva columna quitaríamos IdPais y NombrePais
	CASE WHEN IdPais IN ('ESP','GRC','DEU') THEN 'Europa'
		 WHEN IdPais IN ('USA','MEX','BRA') THEN 'América'
		 WHEN IdPais = 'IND' THEN 'Asia'
	ELSE 'Desconocido'		-- Por si existe algún país no listado. En condiciones ideales en el CASE estarían TODOS los códigos de país agrupados por continentes y esto solo detonaría con errores de inserción
	END AS Continente
FROM Pais;