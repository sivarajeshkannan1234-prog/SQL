use interview;
create table events(
event_id int auto_increment primary key,
event_name varchar(100),
event_date datetime,
create_at timestamp default current_timestamp
);


insert into events(event_name, event_date)
values
('team meeting',  '2025-01-15 10:30;00'),
('conference',    '2025-02-10 09:00:00'),
('online webinar','2025-03-05 15:45:00'),
('workshop',      '2025-03-20 13:30:00');

select* from events;

select event_id , event_name, year(event_date) as event_year from events;

select event_id , event_name, event_date, event_date + interval 30 day as event_date_adding from events;

select event_id,event_name, date_format( event_date,'%W, %M, %e, %Y') as formatted_date from events;

select event_id,event_name, date_format( event_date,'%h, %i, %p') as time_12h_format from events;

select '2025-01-01 10:00:00' as ny_time,
convert_tz('2025-01-01 10:00:00', 'america/new_york','asia/kolkata') as ist_time;