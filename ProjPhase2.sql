DROP TABLE IF EXISTS Hospital CASCADE;
DROP TABLE IF EXISTS Department CASCADE;
DROP TABLE IF EXISTS Doctor CASCADE;
DROP TABLE IF EXISTS Staff CASCADE;
DROP TABLE IF EXISTS Request_Maintenance CASCADE;
DROP TABLE IF EXISTS Appointment CASCADE;
DROP TABLE IF EXISTS Past CASCADE;
DROP TABLE IF EXISTS Active CASCADE;
DROP TABLE IF EXISTS Available CASCADE;
DROP TABLE IF EXISTS Waitlisted CASCADE;
DROP TABLE IF EXISTS Patient CASCADE;
DROP TABLE IF EXISTS Search CASCADE;
DROP TABLE IF EXISTS Has CASCADE;
DROP TABLE IF EXISTS Schedules CASCADE;

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
FOREIGN KEY (dept_ID) REFERENCES Department (dept_ID)
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
PRIMARY KEY (appnt_ID)
);

CREATE TABLE Past(
appnt_ID CHAR(20),
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID)
);

CREATE TABLE Active(
appnt_ID CHAR(20),
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID)
);

CREATE TABLE Available(
appnt_ID CHAR(20),
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID)
);

CREATE TABLE Waitlisted(
appnt_ID CHAR(20),
PRIMARY KEY (appnt_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID)
);

CREATE TABLE Patient(
patient_ID CHAR(20),
name CHAR(20),
gender CHAR(20),
age CHAR(3),
address CHAR(20),
num_appointments INTEGER,
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

CREATE TABLE SEARCH(
appnt_ID CHAR(20),
hospital_ID CHAR(20),
patient_ID CHAR(20),
PRIMARY KEY (appnt_ID, hospital_ID, patient_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID) ON DELETE CASCADE,
FOREIGN KEY (hospital_ID) REFERENCES Hospital (hospital_ID) ON DELETE CASCADE,
FOREIGN KEY (patient_ID) REFERENCES Patient (patient_ID) ON DELETE CASCADE
);

CREATE TABLE Has(
appnt_ID CHAR(20),
doctor_ID CHAR(20),
PRIMARY KEY (appnt_ID, doctor_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID) ON DELETE CASCADE,
FOREIGN KEY (doctor_ID) REFERENCES Doctor (doctor_ID) ON DELETE CASCADE
);

CREATE TABLE Schedules(
appnt_ID CHAR(20),
staff_ID CHAR(20),
PRIMARY KEY (appnt_ID, staff_ID),
FOREIGN KEY (appnt_ID) REFERENCES Appointment (appnt_ID) ON DELETE CASCADE,
FOREIGN KEY (staff_ID) REFERENCES Staff (staff_ID) ON DELETE CASCADE
);
