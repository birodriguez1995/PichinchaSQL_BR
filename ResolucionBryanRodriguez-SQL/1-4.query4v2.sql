-- Pregunta 4: Obtener el mínimo puntaje que ha recibido cada escritor y el evaluador que otorgó esta evaluación
--SUPONIENDO LIBRO=Escritor

--PUNTAJES MINIMOS
select P.LID, MIN(P.puntaje) as MinPuntaje from Puntaje P Group by P.LID;

--TODO
select * 
from (select P2.LID, MIN(P2.puntaje) as MinPuntaje from Puntaje P2 Group by P2.LID) PM 
inner join Puntaje P on PM.LID = P.LID and PM.MinPuntaje=P.puntaje
inner join Evaluador E on E.EID = P.EID
inner join Libro L on L.LID = P.LID;

--FINAL
select L.escritor, E.nombre as EvaluadorNombre, P.puntaje 
from (select P2.LID, MIN(P2.puntaje) as MinPuntaje from Puntaje P2 Group by P2.LID) PM 
inner join Puntaje P on PM.LID = P.LID and PM.MinPuntaje=P.puntaje
inner join Evaluador E on E.EID = P.EID
inner join Libro L on L.LID = P.LID