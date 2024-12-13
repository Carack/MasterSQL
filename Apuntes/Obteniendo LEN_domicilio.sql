-- Obteniendo la cantidad de caracteres del campo domicilio en la tabla paciente

SELECT * FROM Paciente	--Comprobamos la tabla

SELECT LEN(domicilio) AS LEN_domicilio FROM Paciente  -- Obtenemos en una columna llamada LEN_domicilio el número de caracteres del campo domicilio de la tabla Paciente