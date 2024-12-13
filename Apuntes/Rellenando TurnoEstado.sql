-- Rellenando TurnoEstado

INSERT INTO TurnoEstado (idEstado, Descripción)
VALUES (0, 'Pendiente'), (1, 'Realizado'), (2, 'Cancelado'), (3, 'Rechazado'), (4, 'Postergado'), (5, 'Anulado'), (6, 'Derivado')

SELECT * FROM TurnoEstado

-- INSERT INTO TurnoEstado VALUES (2, 'Cesado')
-- Nos arrojaría un error ya que idEstado es una PRIMARY KEY y no puede haber duplicados