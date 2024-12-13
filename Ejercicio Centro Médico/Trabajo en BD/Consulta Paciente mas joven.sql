-- Consulta Paciente
	-- Consulta que devuelva el paciente más joven

SELECT TOP 1 * FROM Paciente ORDER BY fNacimiento DESC  -- Esto funcionaría, pero en el caso de haber más de un paciente nacido en esa fecha solo mostraría uno. 

SELECT * FROM Paciente WHERE fNacimiento = (SELECT MAX(fNacimiento) FROM Paciente)  -- Esto nos daría a todos los pacientes que coincidan con la mayor fecha de nacimiento (el más joven)
