--SQL: Pregunta 2: Para cada libro que tenga más de un puntaje registrado, busque la mayor
--cantidad de puntos que recibió ese libro. Devuelve el título del libro, el evaluador y el puntaje
--recibido. Ordenar de mayor a menor por el puntaje.

--Libros con mas de un puntaje
select P.LID, COUNT(*) as COUNT from Puntaje P Group by P.LID having COUNT(*)>=2;

--Max puntaje de libros mas con mde una calificacion
select P2.LID, COUNT(*), MAX(P2.puntaje) as MaxPuntaje from Puntaje P2 Group by P2.LID having COUNT(*)>=2;

--TODO
select *
from (select P2.LID, COUNT(*) as Count, MAX(P2.puntaje) as MaxPuntaje from Puntaje P2 Group by P2.LID having COUNT(*)>=2) PM
inner join Puntaje P on P.LID=PM.LID and P.puntaje = PM.MaxPuntaje
inner join Evaluador E on E.EID=P.EID
inner join Libro L on L.LID = P.LID ;

--FINAL
select L.titulo as LibroNombre, E.nombre as EvaluadorNombre, P.puntaje
from (select P2.LID, COUNT(*) as Count, MAX(P2.puntaje) as MaxPuntaje from Puntaje P2 Group by P2.LID having COUNT(*)>=2) PM
inner join Puntaje P on P.LID=PM.LID and P.puntaje = PM.MaxPuntaje
inner join Evaluador E on E.EID=P.EID
inner join Libro L on L.LID = P.LID  