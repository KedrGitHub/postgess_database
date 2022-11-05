---o   * Добавьте столбец с информацией о коэффициенте годовой премии к основной таблице. Коэффициент рассчитывается по такой схеме: 
--    базовое значение коэффициента – 1, каждая оценка действует на коэффициент так:
--       Е – минус 20%
--        D – минус 10%
--        С – без изменений
--        B – плюс 10%
--        A – плюс 20%
--Соответственно, сотрудник с оценками А, В, С, D – должен получить коэффициент 1.2.

-- Непонятно, какя таблица является основной да и зачем вообще хранить эту инфу когда ее всегда можно посчитать

with x as (
select 
e_id,
CASE
 WHEN "Q1"='A' THEN 20
 WHEN "Q1"='B' THEN 10
 WHEN "Q1"='С' THEN 0
 WHEN "Q1"='D' THEN -10
 WHEN "Q1"='E' THEN -20
END as  q1,

CASE
 WHEN "Q2"='A' THEN 20
 WHEN "Q2"='B' THEN 10
 WHEN "Q2"='С' THEN 0
 WHEN "Q2"='D' THEN -10
 WHEN "Q2"='E' THEN -20
END as  q2,

CASE
 WHEN "Q3"='A' THEN 20
 WHEN "Q3"='B' THEN 10
 WHEN "Q3"='С' THEN 0
 WHEN "Q3"='D' THEN -10
 WHEN "Q3"='E' THEN -20
END as  q3,

CASE
 WHEN "Q4"='A' THEN 20
 WHEN "Q4"='B' THEN 10
 WHEN "Q4"='С' THEN 0
 WHEN "Q4"='D' THEN -10
 WHEN "Q4"='E' THEN -20
END as  q4

from 
de_sprint_schemas."Scors"
)
	
select 
x.e_id,
e.fio as "ФИО сотрудника",
1+ ((q1+q2+q3+q4)/100::real) as "Коэффициент годовой премии"
from x as x
left join de_sprint_schemas."Employers" e
  on e.e_id = x.e_id
 

