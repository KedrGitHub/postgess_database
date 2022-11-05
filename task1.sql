--o   Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании
SELECT 
e_id, 
fio,  
date_of_workon,
EXTRACT(years FROM justify_interval(now() - date_of_workon)) as stag_in_years
FROM de_sprint_schemas."Employers";