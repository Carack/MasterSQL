-- Rellenando Pago, PagoPaciente y Concepto

INSERT INTO Concepto VALUES ('Laboratorio'), ('Radiografía')

SELECT * FROM Concepto

INSERT INTO Pago (concepto, fecha, monto, estado, obs)
VALUES (2, 2019-02-15, 4500, 0, 'Pago pendiente'), (1, 2019-05-20, 6800, 0, 'Pago pendiente'), (1, 2019-09-27, 5600, 0, 'Pago pendiente')

SELECT * FROM Pago

INSERT INTO PagoPaciente (idPago, idPaciente, idTurno)
VALUES (1, 1, 2),  (2, 2, 7),  (3, 3, 8)

SELECT * FROM PagoPaciente
