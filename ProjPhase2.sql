DROP TABLE IF EXISTS Hospital;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Request_Maintenance;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Past;
DROP TABLE IF EXISTS Active;
DROP TABLE IF EXISTS Available;
DROP TABLE IF EXISTS Waitlisted;
DROP TABLE IF EXISTS Patient;

CREATE TABLE Hospital(
hospital_ID CHAR(20),
name CHAR(20),
PRIMARY KEY (hospital_ID)
);

CREATE TABLE Department(
dept_ID CHAR(20),
hospital_ID CHAR(20),		//Department is many, therefore hospital_ID
name CHAR(20),
PRIMARY KEY (dept_ID),
FOREIGN KEY (hospital_ID) REFERENCES Hospital (hospital_ID)
);

CREATE TABLE Doctor(
doctor_ID CHAR(20),
dept_ID CHAR(20),		//Doctor is many, therefore Department_ID
name CHAR(20),
specialty CHAR(20),
PRIMARY KEY (doctor_ID),
FOREIGN KEY (dept_ID) REFERENCES Hospital (hospital_ID)
);

CREATE TABLE Staff(
staff_ID CHAR(20),
hospital_ID CHAR(20),		//is many, therefore hospital_ID
name CHAR(20),
PRIMARY KEY (staff_ID),
FOREIGN KEY (hospital_ID) REFERENCES Hospital (hospital_ID)
);

CREATE TABLE Appointment(
appnt_ID CHAR(20),
date CHAR(20),
time_slot CHAR(20),
type ENUM("past", "active", "available", "waitlisted") NOT NULL,
PRIMARY KEY (appnt_ID),
);



//This website says to do IS_A this way, idk
//https://dba.stackexchange.com/questions/5501/how-do-i-map-an-is-a-relationship-into-a-database
//



CREATE TABLE Past(
appnt_ID CHAR(20),
date CHAR(20),
time_slot CHAR(20),
type ENUM("past") NOT NULL,
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID, date, time_slot, type) REFERENCES Appointment (appnt_ID, date, time_slot, type)
);

CREATE TABLE Active(
appnt_ID CHAR(20),
date CHAR(20),
time_slot CHAR(20),
type ENUM("active") NOT NULL,
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID, date, time_slot, type) REFERENCES Appointment (appnt_ID, date, time_slot, type)
);

CREATE TABLE Available(
appnt_ID CHAR(20),
date CHAR(20),
time_slot CHAR(20),
type ENUM("available") NOT NULL,
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID, date, time_slot, type) REFERENCES Appointment (appnt_ID, date, time_slot, type)
);

CREATE TABLE Waitlisted(
appnt_ID CHAR(20),
date CHAR(20),
time_slot CHAR(20),
type ENUM("waitlisted") NOT NULL,
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID, date, time_slot, type) REFERENCES Appointment (appnt_ID, date, time_slot, type)
);



//This website says to do IS_A this way, idk
//https://dba.stackexchange.com/questions/5501/how-do-i-map-an-is-a-relationship-into-a-database
//




CREATE TABLE Patient(
patient_ID CHAR(20),
name CHAR(20),
gender CHAR(20),
age CHAR(3),
address CHAR(20)
#appointments INTEGER,
PRIMARY KEY (appnt_ID)
);

CREATE TABLE Request_Maintenance(		//gets table cuz many2many
doctor_ID CHAR(20),
staff_ID CHAR(20),
patient_per_hour CHAR(20),
dept_name CHAR(20),
time_slot CHAR(20),
PRIMARY KEY (doctor_ID, staff_ID),
FOREIGN KEY (doctor_ID) REFERENCES Doctor (doctor_ID),
FOREIGN KEY (staff_ID) REFERENCES Staff (staff_ID)
);