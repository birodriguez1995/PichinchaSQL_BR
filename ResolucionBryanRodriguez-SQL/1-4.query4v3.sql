-- Pregunta 4: Obtener el mínimo puntaje que ha recibido cada escritor y el evaluador que otorgó esta evaluación
-- AGRUPANDO x escritor

--PUNTAJES MINIMOS
select L2.escritor, MIN(P2.puntaje) as MinPuntaje from Puntaje P2 inner join Libro L2 on P2.LID=L2.LID Group by L2.escritor;

--TODO
select * 
from (select L2.escritor, MIN(P2.puntaje) as MinPuntaje from Puntaje P2 inner join Libro L2 on P2.LID=L2.LID Group by L2.escritor) PM 
inner join Libro L on L.escritor = PM.escritor
inner join Puntaje P on L.LID=P.LID and P.puntaje=PM.MinPuntaje
inner join Evaluador E on E.EID = P.EID
;

--FINAL
select L.escritor, E.nombre as EvaluadorNombre, P.puntaje 
from (select L2.escritor, MIN(P2.puntaje) as MinPuntaje from Puntaje P2 inner join Libro L2 on P2.LID=L2.LID Group by L2.escritor) PM 
inner join Libro L on L.escritor = PM.escritor
inner join Puntaje P on L.LID=P.LID and P.puntaje=PM.MinPuntaje
inner join Evaluador E on E.EID = P.EID