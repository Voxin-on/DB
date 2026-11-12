-- Продолжаем работать с таблицей clients.

--     Сделайте выборку id и имен клиентов, приведенных: 
--         а) к верхнему регистру, 
--         б) к нижнему регистру.

select id, upper(name) from clients;
select id, lower(name) from clients;

-- Выведите по каждому клиенту фамилию и имя в одном столбце, а в другом номер телефона в сокращенном 
-- виде: первые три и последнюю одну цифру в открытом виде, остальные символы закрыть знаком x, * или # 
-- (например, должно получиться так: 977***4). Первому столбцу дайте имя full_name, второму phone_number.

select concat(name, ' ', lastname) as full_name,
concat( left(phone, 3), repeat('*', length(phone)-4), right(phone, 1)) as phone_number 
from clients; 

-- Выведите по каждому клиенту, в фамилии которого есть такие вхождения строк tt, ss, ll, имя и фамилию 
-- приведите к формату, где имя будет сокращено до 1 символа с точкой (например: J. Wiliams)

select concat(left(name, 1), '. ', lastname) as full_name from clients
where lastname regexp 'tt|ss|ll';

-- Найдите все записи, в которых телефонные номера: 

--     а) начинаются на 586, 
--     б) содержат 657, 
--     в) заканчиваются на 707.
--     Составьте запросы из всех возможных вариантов, поиска таких подстрок.

select id, phone from clients
where phone like '586%';

select id, phone from clients
where phone like '%657%';

select id, phone from clients
where phone like '%707';