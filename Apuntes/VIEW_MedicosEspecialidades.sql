-- Creamos una visrta para almacenar médicos y sus especialidades

	-- Podemos usar esta vista de este modo
		
		-- SELECT * FROM VIEW_MedicosEspecialidades 

CREATE VIEW VIEW_MedicosEspecialidades AS 
	SELECT m.idMedico, m.nombre, m.apellido, me.idEspecialidad, me.descripcion FROM Medico M
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico = M.idMedico	