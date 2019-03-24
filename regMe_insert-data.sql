use registerMeDB;
ALTER TABLE `registerMeDB`.`TimeSlot` ADD INDEX `Constraint` (`startTime` ASC);
ALTER TABLE `registerMeDB`.`EmpTemplate`
  ADD INDEX `FK_Constraint` (`employee_id` ASC, `weekday_id` ASC);


#Settings 
INSERT INTO registerMeDB.Weekday (`name`) VALUES ('Poniedziałek'),('Wtorek'),('Środa'),('Czwartek'),('Piątek'),('Sobota');

INSERT INTO registerMeDB.TimeSlot (`startTime`, `endTime`) VALUES ('8:00','8:30'),('8:30','9:00'),('9:00','9:30'),('9:30','10:00'),
('10:00','10:30'),('10:30','11:00'),('11:00','11:30'),('11:30','12:00'),('12:00','12:30'),('12:30','13:00'),('13:00','13:30'),
('13:30','14:00'),('14:00','14:30'),('14:30','15:00'),('15:00','15:30'),('15:30','16:00'),('16:00','16:30'),('16:30','17:00'),
('17:00','17:30'),('17:30','18:00');

#Employees
INSERT INTO registerMeDB.Employee (firstName, lastName, email) values ('Iza','Kowalska','iza@op.pl'),('Irena','Malinowska','im@wp.pl');

#Grafik_pracy
#INSERT INTO registerMeDB.EmpTemplate (`startTime`,`endTime`,`employee_id`,`weekday_id`) VALUES ('08:00', '16:00', 1, 1),
('08:00', '16:00', 1, 2),('08:00', '16:00', 1, 3),('08:00', '16:00', 1, 4),('08:00', '16:00', 1, 5),('10:00', '16:00', 1, 6);

#UPDATE `registerMeDB`.`Employee` SET `id`='3' WHERE `id`='4';

COMMIT;
SELECT * FROM registerMeDB.Weekday;
SELECT * FROM registerMeDB.Employee;
SELECT * FROM registerMeDB.EmpTemplate;
