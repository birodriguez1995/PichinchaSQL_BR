-- LIKES NO AMIGOS
Select L.* from Likes L
where 
not exists(select 1 from Friend F where F.ID1=L.ID1 and F.ID2=L.ID2)
AND
not exists(select 1 from Friend F where F.ID1=L.ID2 and F.ID2=L.ID1)
;

--TOTAL
Select 
HA.name as "A_Name", HA.grade as "A_Grade",
HB.name as "B_Name", HB.grade as "B_Grade",
HC.name as "C_Name", HC.grade as "C_Grade"
from Likes L
Inner join Friend C1 on L.ID1 = C1.ID1 --AMIGOS 1
Inner join Friend C2 on L.ID2 = C2.ID1 --AMIGOS 2
Inner join Highschooler HA on HA.ID = L.ID1
Inner join Highschooler HB on HB.ID = L.ID2
Inner join Highschooler HC on HC.ID = C1.ID2
where 
not exists(select 1 from Friend F where F.ID1=L.ID1 and F.ID2=L.ID2)
AND
not exists(select 1 from Friend F where F.ID1=L.ID2 and F.ID2=L.ID1)
AND C1.ID2=C2.ID2

