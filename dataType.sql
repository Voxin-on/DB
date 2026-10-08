create table games (
    id int primary key auto_increment,
    title varchar(255) not null,
    rating decimal(3,1),
    genre varchar(32),
    country varchar(64),
    released_at date,
    time_completion_h smallint,
    age_rating varchar(3),
    has_sequel boolean,
    has_multiplayer boolean,
    platform set('PC','PS','Xbox','Switch','Mobile'),
    engine varchar(64)
);

insert into games (title, rating, genre, country, released_at, 
time_completion_h, age_rating, has_sequel, has_multiplayer, platform, engine) 
values
('The Witcher 3: Wild Hunt', 9.8, 'RPG', 'Poland', '2015-05-19', 100, '18', true, false, 'PC,PS,Xbox,Switch', 'REDengine 3'),
('Detroit: Become Human', 9.0, 'Adventure', 'France', '2018-05-25', 15, '18', false, false, 'PC,PS', 'Quantic Dream Engine'),
('Grand Theft Auto V', 9.5, 'Action', 'USA', '2013-09-17', 30, '18', false, true, 'PC,PS,Xbox', 'RAGE'),
('Counter-Strike 2', 8.7, 'Shooter', 'USA', '2023-09-27', 50, '18', false, true, 'PC', 'Source 2'), 
('Dota 2', 9.1, 'MOBA', 'USA', '2013-07-09', 200, '12', false, true, 'PC', 'Source 2'),
('The Witcher', 8.2, 'RPG', 'Poland', '2007-10-26', 35, '18', true, false, 'PC', 'Aurora engine'),
('The Witcher 2: Assassins of Kings', 8.8, 'RPG', 'Poland', '2011-05-17', 24, '18', true, false, 'PC,Xbox', 'REDengine'),
('Grand Theft Auto: San Andreas', 9.5, 'Action', 'USA', '2004-10-26', 30, '18', false, false, 'PC,PS,Xbox,Mobile', 'RenderWare'),
('Mount & Blade II: Bannerlord', 8.0, 'RPG', 'Turkey', '2022-10-25', 56, '16', false, true, 'PC,PS,Xbox', 'In-house engine'),
('Stardew Valley', 9.4, 'Simulation', 'USA', '2016-02-26', 53, '10', false, true, 'PC,PS,Xbox,Switch,Mobile', 'MonoGame');