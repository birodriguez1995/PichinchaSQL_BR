-- SQL: Pregunta 3: Para el escenario que un evaluador asigno un puntaje al libro más de una vez,con
-- un puntaje menor en la seguna ocasion, devuelva el nombre del evaluador y el título del libro.

--Libros con mas de un puntaje a libro x evaluador
select P.LID, P.EID, COUNT(*) as COUNT from Puntaje P Group by P.LID, P.EID having COUNT(*)>=2;

-- puntajes de un libro, con 2 evaluaciones del mismo evaluador. 
-- ultima fecha evaluacion con puntuacion menor
select P2.LID, P2.EID, COUNT(*), MIN(P2.puntaje) as MinPuntaje, MAX(P2.FechaEvaluacion) MaxFechaEvaluacion from Puntaje P2 Group by P2.LID, P2.EID having COUNT(*)>=2;

--TODO
select *
from 
(select P2.LID, P2.EID, COUNT(*), MIN(P2.puntaje) as MinPuntaje, MAX(P2.FechaEvaluacion) MaxFechaEvaluacion from Puntaje P2 Group by P2.LID, P2.EID having COUNT(*)>=2) PM
inner join Puntaje P on P.LID=PM.LID and P.EID=PM.EID and P.puntaje = PM.MinPuntaje and P.FechaEvaluacion = PM.MaxFechaEvaluacion
inner join Evaluador E on E.EID=P.EID
inner join Libro L on L.LID = P.LID ;

--FINAL
select L.titulo as LibroNombre, E.nombre as EvaluadorNombre, P.puntaje
from 
(select P2.LID, P2.EID, COUNT(*) as Cantidad, MIN(P2.puntaje) as MinPuntaje, MAX(P2.FechaEvaluacion) as MaxFechaEvaluacion 
	from Puntaje P2 Group by P2.LID, P2.EID having COUNT(*)>=2) PM
inner join Puntaje P on P.LID=PM.LID and P.EID=PM.EID and P.puntaje = PM.MinPuntaje and P.FechaEvaluacion = PM.MaxFechaEvaluacion
inner join Evaluador E on E.EID=P.EID
inner join Libro L on L.LID = P.LID 