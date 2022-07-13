--SQL: Pregunta 1: Busque los títulos de todos los libros que tienen puntajes y ordenarlos por el año de menor a mayor.

select titulo from Libro l, Puntaje p where l.LID = p.LID order by l.anio 
