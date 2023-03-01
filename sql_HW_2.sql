create table employees(
id serial primary key,
employee_name varchar (50) not null 
);

create table salary1(
id serial primary key,
monthly_salary int not null 
);

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary1_id int not null
);

create table roles1(
id serial primary key,
role_name int not null unique
);

create table  roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
 foreign key (employee_id)
  references employees(id),
 foreign key (role_id)
  references roles1(id)
);
drop table roles_employee;
alter table roles1
alter column role_name type varchar(30);

drop table employee_salary;

insert into employees (employee_name)
 values ('Ivan');
 
insert into salary1 (monthly_salary)
 values  (3000),
         (4100),
         (5200);

insert into employee_salary (employee_id, salary1_id)
 values  (47, 5),
         (45, 14),
         (53, 10);
insert into roles1 (role_name)
 values ; 
 
insert into roles_employee (employee_id, role_id)
values   (46, 8),
         (49, 8),
         (52, 8);
       
       
select * from employees;
 select * from employee_salary;
 select * from roles1;
 select * from roles_employee;
 select * from salary1;
 
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary1.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join salary1 
on salary1.id = employee_salary.salary1_id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary1.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join salary1 
on salary1.id = employee_salary.salary1_id
where monthly_salary < 2000 ;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, salary1.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
right join salary1 
on salary1.id = employee_salary.salary1_id
where employee_salary.employee_id is null;
--4.Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, salary1.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
right join salary1 
on salary1.id = employee_salary.salary1_id
where employee_salary.employee_id is null and monthly_salary < 2000;
-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, salary1.monthly_salary
from employees left join employee_salary
on employees.id = employee_salary.employee_id
left join salary1 
on salary1.id = employee_salary.salary1_id
where employee_salary.salary1_id is null;
-- 6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles1.role_name
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id;
-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles1.role_name
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id
where roles1.role_name like '%Java__developer%' ;
-- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles1.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id
where roles1.role_name like '%Python%' ;
-- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles1.role_name
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id
where roles1.role_name like '%QA_engineer%' ;
-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles1.role_name
from employees join roles_employee 
on employees.id = roles_employee.employee_id
join roles1 
on roles1.id = roles_employee.role_id
where roles1.role_name like '%Manual_QA_engineer%';
-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles1.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id 
join roles1 on roles1.id = roles_employee.role_id
where roles1.role_name like '%Automation_QA_engineer%';
--12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id 
join employee_salary
on employees.id = employee_salary.employee_id 
join salary1 on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Junior%' ;
-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 on roles1.id = roles_employee.role_id 
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Middle%' ;
-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Senior%' ;
-- 15. Вывести зарплаты Java разработчиков
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id
join roles1 
on roles1.id = roles_employee.role_id 
join employee_salary
on employees.id = employee_salary.employee_id 
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Java__developer%' ;
--16. Вывести зарплаты Python разработчиков
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id 
join employee_salary
on employees.id = employee_salary.employee_id 
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Python%' ;
--17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id
join roles1 
on roles1.id = roles_employee.role_id 
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Junior_Python%' ;
--18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Middle_JavaScript%' ;
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id
join roles1 
on roles1.id = roles_employee.role_id 
join employee_salary
on employees.id = employee_salary.employee_id 
join salary1
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Senior_JavaScript%' ;
-- 20. Вывести зарплаты Junior QA инженеров
select roles1.role_name, salary1.monthly_salary
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles1
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id 
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Junior%engineer%' ;
--21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select avg(monthly_salary)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%JavaScript%';
-- 23.Вывести минимальную ЗП QA инженеров
select min(monthly_salary)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%QA_engineer%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%QA_engineer%';
--25. Вывести количество QA инженеров
select count(employee_name)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%QA_engineer%';
-- 26. Вывести количество Middle специалистов.
select count(employee_name)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%Middle%';
--27. Вывести количество разработчиков
select count(employee_name)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary)
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where roles1.role_name like '%developer%';
--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
order by(monthly_salary) asc ;
 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where monthly_salary >= 1700 and monthly_salary <= 2300
order by(monthly_salary) asc ;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where monthly_salary < 2300
order by(monthly_salary) asc ;
--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles1.role_name, salary1.monthly_salary
from employees join roles_employee
on employees.id = roles_employee.role_id
join roles1 
on roles1.id = roles_employee.role_id
join employee_salary
on employees.id = employee_salary.employee_id
join salary1 
on salary1.id = employee_salary.salary1_id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by(monthly_salary) asc ;




