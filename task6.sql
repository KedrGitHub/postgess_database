--o   * Выведите название самого крупного отдела

with x as
(
select 
dept_id,
count(e_id) as cnt
from 
de_sprint_schemas.e_to_dept
group by dept_id
order by cnt desc
limit 1
)

select 
name
from 
de_sprint_schemas."Departments" D
where d.dept_id = (select dept_id from x)
