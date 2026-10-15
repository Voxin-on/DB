-- Найдите клиентов Gary Harrison, Michael Atwood, Amy Majors, Katherine Smith и обновите дату их рождения до 21.10.1930, 12.04.1934, 01.08.1975, 22.09.1959 соответственно.

select id, name, lastname from clients 
where (name = 'Gary' and lastname = 'Harrison' and dbirth <> '1930-10-21')
or (name = 'Michael' and lastname = 'Atwood' and dbirth <> '1934-04-12')
or (name = 'Amy' and lastname = 'Majors' and dbirth <> '1975-08-01')
or (name = 'Katherine' and lastname = 'Smith' and dbirth <> '1959-09-22')
limit 10;

create table client_back as select * from clients 
where id in (240, 782) 
limit 2;

update clients 
set dbirth = if(id = 782, '1930-10-21', 
'1975-08-01')
where id in (782, 240) 
limit 2;

-- Query OK, 2 rows affected (0,00 sec)
-- Rows matched: 2  Changed: 2  Warnings: 0


-- Найдите клиентов с годом рождения ранее 1933 года и удалите номер телефона.

select id, dbirth, phone from clients 
where year(dbirth) < 1933;

select count(id) from clients
where year(dbirth) < 1933;

insert into client_back
select * from clients
where year(dbirth) < 1933
limit 13;

update clients
set phone = null
where year(dbirth) < 1933
limit 13;

-- Query OK, 13 rows affected (0,01 sec)
-- Rows matched: 13  Changed: 13  Warnings: 0


-- Исправьте ошибку клиента John Ohara, его настоящее имя Johanna Ohara, не забудьте поправить и пол клиента.

select id, name, lastname, gender
from clients
where name = 'John' and lastname = 'Ohara'
limit 10;

insert into client_back 
select * from clients
where id = 570
limit 1;

update clients
set name = 'Johanna', gender = 'F'
where id = 570
limit 1;

-- Query OK, 1 row affected (0,00 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0


-- Замените номера телефонов Humberto Hoosier, Irene Schreiber, Donna Wallace на произвольные значения (для каждого свои).

select id, name, lastname
from clients
where (name = 'Humberto' and lastname = 'Hoosier')
or (name = 'Irene' and lastname = 'Schreiber')
or (name = 'Donna' and lastname = 'Wallace')
limit 10;

insert into client_back 
select * from clients
where id in (293, 447, 673) 
limit 3;

update clients 
set phone = if(id = 293, '5511234', 
if (id = 447, '5511235', 
'5533456'))
where id in (293, 447, 673) 
limit 3;

-- Query OK, 3 rows affected (0,00 sec)
-- Rows matched: 3  Changed: 3  Warnings: 0


-- Удалите клиентов с ID 215, 340, 449, 470, 607.

select id, name, lastname
from clients
where id in (215, 340, 449, 470, 607);

insert into client_back 
select * from clients
where id in (215, 340, 449, 607)
limit 5;

delete from clients
where id in (215, 340, 449, 607)
limit 4;

-- Query OK, 4 rows affected (0,00 sec)


-- Удалите клиентов мужского пола с датой рождения в период с 01.01.1941 по 30.04.1941 и с 10.09.1972 по 15.09.1972

select id, gender, dbirth from clients
where gender = 'M'
and ( 
    dbirth between '1941-01-01' and '1941-04-30'
    or dbirth between '1972-09-10' and '1972-09-15'
);

insert into client_back 
select * from clients
where id in (383, 839)
limit 2;

delete from clients
where id in (383, 839)
limit 2;

-- Query OK, 2 rows affected (0,01 sec)