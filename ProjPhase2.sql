DROP TABLE Hospital CASCADE;
DROP TABLE Department CASCADE;
DROP TABLE Doctor CASCADE;
DROP TABLE Staff CASCADE;
DROP TABLE Request_Maintenance CASCADE;
DROP TABLE Appointment CASCADE;
DROP TABLE Past CASCADE;
DROP TABLE Active CASCADE;
DROP TABLE Available CASCADE;
DROP TABLE Waitlisted CASCADE;
DROP TABLE Patient CASCADE;

CREATE TABLE Hospital(
hospital_ID CHAR(20),
name CHAR(20),
PRIMARY KEY (hospital_ID)
);

CREATE TABLE Department(
dept_ID CHAR(20),
hospital_ID CHAR(20),
name CHAR(20),
PRIMARY KEY (dept_ID),
FOREIGN KEY (hospital_ID) REFERENCES Hospital (hospital_ID)
);

CREATE TABLE Doctor(
doctor_ID CHAR(20),
dept_ID CHAR(20),
name CHAR(20),
specialty CHAR(20),
PRIMARY KEY (doctor_ID),
FOREIGN KEY (dept_ID) REFERENCES Hospital (hospital_ID)
);

CREATE TABLE Staff(
staff_ID CHAR(20),
hospital_ID CHAR(20),
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

CREATE TABLE Patient(
patient_ID CHAR(20),
name CHAR(20),
gender CHAR(20),
age CHAR(3),
address CHAR(20)
#appointments INTEGER,
PRIMARY KEY (patient_ID)
);

CREATE TABLE Request_Maintenance(
doctor_ID CHAR(20),
staff_ID CHAR(20),
patient_per_hour CHAR(20),
dept_name CHAR(20),
time_slot CHAR(20),
PRIMARY KEY (doctor_ID, staff_ID),
FOREIGN KEY (doctor_ID) REFERENCES Doctor (doctor_ID),
FOREIGN KEY (staff_ID) REFERENCES Staff (staff_ID)
);
