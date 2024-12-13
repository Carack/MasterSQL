-- Obtenemos las iniciales de los pacientes

SELECT * FROM Paciente		-- Visualizamos la tabla para comprobar los nombres de los campos y la salida

SELECT LEFT(nombre,1) + LEFT(apellido,1) AS Iniciales FROM Paciente   -- Realizamos la búsqueda