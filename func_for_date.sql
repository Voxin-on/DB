-- Из таблицы clients сделайте по каждому клиенту выборку года рождения;

select id, name, lastname, year(dbirth) from clients;

-- Вычислите по каждому клиенту его текущий возраст относительно сегодняшней даты: 

--     а) полных лет, 

--     б) лет до конца текущего года;

select id, name, lastname, timestampdiff(year, dbirth, now()) as age from clients;

select id, name, lastname, year(curdate()) - year(dbirth) as age_at_year_end from clients;

-- Подсчитайте сколько было/будет полных лет каждому клиенту на: 

--     а) 8 декабря 1992 года, 

--     б) 15 июля 2024 года;

select id, name, lastname, timestampdiff(year, dbirth, '1992-12-08') as age from clients
where timestampdiff(year, dbirth, '1992-12-08') > 0;

select id, name, lastname, timestampdiff(year, dbirth, '2024-07-15') as age from clients
where timestampdiff(year, dbirth, '2024-07-15') > 0;

-- Найдите клиентов, у которых планируется день рождения: 

--     а) в ближайшую неделю, 
--     б) в ближайшие две недели, 
--     в) до конца текущего месяца

select id, name, lastname, dbirth from clients
where datediff(
    date_format(dbirth, concat(year(curdate()) + (date_format(dbirth,'%m-%d') < 
    date_format(curdate(),'%m-%d')), '-%m-%d')), curdate()
) between 0 and 7;

select id, name, lastname, dbirth from clients
where datediff(
    date_format(dbirth, concat(year(curdate()) + (date_format(dbirth,'%m-%d') < 
    date_format(curdate(),'%m-%d')), '-%m-%d')), curdate()
) between 0 and 14;

select id, name, lastname, dbirth from clients
where date_format(dbirth, '%m-%d') between date_format(curdate(), '%m-%d')
and date_format(last_day(curdate()), '%m-%d');