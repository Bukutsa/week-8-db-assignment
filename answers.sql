----

CREATE DATABASE Clinic Booking System;

CREATE TABLE Patient (
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    patientId INT AUTO INCREMENT PRIMARY KEY,
    dateofBirth DATE NOT NULL,
    Telephone VARCHAR(50)  NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male' 'Female')
    homeaddress VARCHAR (200)
);

---
CREATE TABLE Department (
    departmentid INT AUTO INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)

);

--- 
CREATE TABLE Doctor(
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    doctor_id INT AUTO INCREMENT PRIMARY KEY,
    specialization VARCHAR(100),
    telephone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),

);

---


CREATE TABLE Appointment(
    appointmentId INT AUTO_INCREMENT PRIMARY KEY,
    patientId INT NOT NULL,
    doctorId INT NOT NULL,
    appointmentDate DATETIME NOT NULL,
    reason VARCHAR(255),
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patientId) REFERENCES Patient(patientId),
    FOREIGN KEY (doctorId) REFERENCES Doctor(doctorId),

);

---


CREATE TABLE Treatment (
    treatmentId INT AUTO_INCREMENT PRIMARY KEY,
    appointmentId INT NOT NULL UNIQUE,
    diagnosis TEXT NOT NULL,
    treatmentPlan TEXT NOT NULL,
    FOREIGN KEY (appointmentId) REFERENCES Appointment(appointmentId),

);


---


CREATE TABLE Prescription (
    prescriptionId INT AUTO_INCREMENT PRIMARY KEY,
    treatmentId INT NOT NULL,
    medicationName VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50) NOT NULL,
    duration VARCHAR(50),
    FOREIGN KEY (treatmentId) REFERENCES Treatment(treatmentId),
);