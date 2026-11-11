--     [#] Задача 14.

-- Блюдо (КодБлюда, КодПродукта, НазвБлюда, КолДанногоПродуктаВБлюде)

-- Блюдо готовится из нескольких продуктов, продукт может использоваться в неск. блюдах

create table dish (
    dish_id int,
    product_id int,
    name varchar(255) not null,
    quantity_products decimal(6,2) not null,
    primary key(dish_id, product_id)
);

insert into dish (dish_id, product_id, name, quantity_products) values
(1, 1, 'Пицца', 2),
(1, 2, 'Пицца', 1),
(1, 3, 'Пицца', 3),
(2, 1, 'Салат', 4),
(2, 4, 'Салат', 2);

-- исправление
alter table dish rename to dish_ingredients;

create table product (
    id int primary key,
    name varchar(255) not null
);

create table dish (
    id int primary key,
    name varchar(255) not null
);

insert into product (id, name) values
(1, 'помидоры'),
(2, 'тесто'),
(3, 'колбаса'),
(4, 'зелень');

insert into dish (id, name)
select distinct dish_id, name from dish_ingredients;

alter table dish_ingredients drop column name;

alter table dish_ingredients
add constraint fk_dish foreign key (dish_id) references dish(id),
add constraint fk_product foreign key (product_id) references product(id);


--в денормализованной форме всё хранилось в 1 таблице, но находилась в 1нф

--вынес продукты в отдельную таблицу так как если добавить имя продукта он будет зависеть 
--от части составного ключа так как у нас 2 ключа, что нарушает 2 нормальную форму, поэтому 
--сейчас продукт отдельная таблица со своим уникальным ключем

--с блюдами такая же проблема, что имя зависило от части составного ключа, также нарушая 2 нормальную 
--форму, также вынес в отдельную таблицу со своим ключём

--теперь схема в 3нф
