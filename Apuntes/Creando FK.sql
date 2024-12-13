-- Creando las Foreing Key entre Paciente y Pais y entre Paciente e HistoriaPaciente

ALTER TABLE Paciente 
ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais)  -- Hacemos una referencia de 1 a 1

ALTER TABLE HistoriaPaciente
ADD FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)  -- En este caso la referencia es de 1 a muchos por eso debe hacerse en este orden