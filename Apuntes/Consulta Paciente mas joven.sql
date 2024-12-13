-- Consulta Paciente
	-- Consulta que devuelva el paciente m�s joven

SELECT TOP 1 * FROM Paciente ORDER BY fNacimiento DESC  -- Esto funcionar�a, pero en el caso de haber m�s de un paciente nacido en esa fecha solo mostrar�a uno. 

SELECT * FROM Paciente WHERE fNacimiento = (SELECT MAX(fNacimiento) FROM Paciente)  -- Esto nos dar�a a todos los pacientes que coincidan con la mayor fecha de nacimiento (el m�s joven)
