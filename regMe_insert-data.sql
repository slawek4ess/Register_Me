use registerMe;

INSERT INTO registerMe.weekdays (`name`) VALUES ('Poniedz.'),('Wtorek'),('Środa'),('Czwartek'),('Piątek'),('Sobota');
INSERT INTO registerMe.employees (firstName, lastName, email) values ('Iza','Kowalska','iza@op.pl'),('Irena','Malinowska','im@wp.pl');
INSERT INTO registerMe.empl_wrk_hours (`startTime`,`endTime`,`employee_id`,`weekday_id`) VALUES ('08:00', '16:00', '1', '1'),
('08:00', '16:00', '1', '2'),('08:00', '16:00', '1', '3'),('08:00', '16:00', '1', '4'),('08:00', '16:00', '1', '5'),('10:00', '16:00', '1', '6');

COMMIT;
SELECT * FROM registerMe.weekdays;