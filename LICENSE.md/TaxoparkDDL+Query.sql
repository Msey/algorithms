  IF OBJECT_ID('Sessions', 'U') IS NOT NULL 
  DROP TABLE Sessions; 

  IF OBJECT_ID('Drivers', 'U') IS NOT NULL   
  DROP TABLE Drivers; 

  IF OBJECT_ID('Cars', 'U') IS NOT NULL 
  DROP TABLE Cars; 

CREATE TABLE Drivers (
    ID        INT PRIMARY KEY,
    LastName  VARCHAR(255),
    FirstName VARCHAR(255)
);

CREATE TABLE Cars (
    ID        INT PRIMARY KEY,
    Model     VARCHAR(255)
);

CREATE TABLE Sessions (
	DriverID  INT,
	CarID     INT,
	DriveDate DATETIME,
	FOREIGN KEY (DriverID) REFERENCES Drivers (ID),
	FOREIGN KEY (CarID)    REFERENCES Cars (ID)
);


INSERT INTO Drivers
VALUES (0, 'Bill',   'Gates'),
       (1, 'Mark',   'Zuckerberg'),
       (2, 'Elon',   'Musk'),
       (3, 'Jeff',   'Bezos'),
       (4, 'Steve',  'Jobs'),
       (5, 'Sergey', 'Brin'),
       (6, 'Will',   'Hewlett');

INSERT INTO Cars
VALUES (0, 'Lada'),
       (1, 'Buhanka'),
       (2, 'BMW'),
       (3, 'Ferrari'),
       (4, 'UAZ'),
       (5, 'Mercedes-Benz'),
       (6, 'Porsche'),
       (7, 'Alfa-Romero'),
       (8, 'Cadillac'),
       (9, 'Bentley');
	   
INSERT INTO Sessions
VALUES (1, 0, '2014-11-24T05:20:00'),
       (0, 1, '2015-02-24T04:35:00'),
       (0, 5, '2013-10-24T07:40:00'),
       (1, 8, '2013-02-24T10:50:00'),
       (0, 1, '2013-03-24T14:30:01'),
       (2, 3, '2015-06-24T19:10:00'),
       (2, 4, '2021-06-24T23:15:00'),
       (3, 9, '2021-06-24T07:00:00'),
       (5, 3, '2021-07-24T07:30:00'),
       (6, 6, '2021-07-24T07:30:00'),
       (3, 5, '2021-11-24T11:00:00'),
       (6, 6, '2020-07-24T14:30:00'),
       (3, 3, '2020-07-24T17:00:00'),
       (1, 8, '1999-07-24T19:30:00'),
       (2, 7, '2020-11-24T02:35:00');



/* ============= кто, когда и кого ================ */

  SELECT D.FirstName + ' ' + D.LastName AS Driver, 
  	     S.DriveDate AS SessionDate, 
  	     C.Model AS Car
    FROM Sessions S
  	     INNER JOIN Drivers D ON S.DriverID = D.ID
         INNER JOIN Cars C ON S.CarID = C.ID
ORDER BY Driver
