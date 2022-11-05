--o   Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E
select 
e.e_id 
from de_sprint_schemas."Employers" as e
join  de_sprint_schemas."Scors" as s 
on e.e_id = s.e_id
where 
 s."Q1" in ('D', 'E')
or
 s."Q2" in ('D', 'E')
or
 s."Q3" in ('D', 'E')
or
 s."Q4" in ('D', 'E')
