create database grocery;
use grocery;
CREATE TABLE Products (
SKU varchar(30), 
Section_Num int, 
Weight int NOT NULL,
Amount int NOT NULL,
Product_Name varchar (30) NOT NULL UNIQUE,
Price int NOT NULL,
PRIMARY KEY (SKU) 
);

CREATE TABLE Staff (
Staff_ID int AUTO_INCREMENT, 
Name varchar(50) NOT NULL, 
sSin varchar(20) NOT NULL UNIQUE, 
Address varchar(50) NOT NULL, 
Birthdate date NOT NULL, 
PhoneNum varchar(15) NOT NULL UNIQUE, 
Email varchar(30) NOT NULL UNIQUE, 
Bank_Info varchar(30) NOT NULL UNIQUE,
Date_info_Start date NOT NULL, 
PRIMARY KEY(Staff_ID)
); 

CREATE TABLE Workers (
Staff_ID int, 
Hourly_Rate int DEFAULT 12 NOT NULL, 
Role varchar(20) NOT NULL, 
Mentor_ID int, 
PRIMARY KEY(Staff_ID),
FOREIGN KEY(Staff_ID) REFERENCES Staff (Staff_ID) ON DELETE CASCADE, 
FOREIGN KEY(Mentor_ID) REFERENCES Staff (Staff_ID) ON DELETE CASCADE
);

CREATE TABLE Manager (
Staff_ID int, 
Salary int DEFAULT 1000000 NOT NULL, 
Date_info_Start_Manager date NOT NULL, 
PRIMARY KEY(Staff_ID),
FOREIGN KEY(Staff_ID) REFERENCES Staff (Staff_ID) ON DELETE CASCADE
);

CREATE TABLE Producers (
P_ID int AUTO_INCREMENT, 
Email varchar(30) NOT NULL UNIQUE,
PhoneNum varchar(15) NOT NULL UNIQUE,
P_Name varchar(50) NOT NULL UNIQUE,
Owner_Name varchar(50) NOT NULL,
Address varchar(40) NOT NULL UNIQUE,
PRIMARY KEY(P_ID)
);

CREATE TABLE Vendors (
V_ID int AUTO_INCREMENT, 
Email varchar(30) NOT NULL UNIQUE,
PhoneNum varchar(15) NOT NULL UNIQUE,
V_Name varchar(50) NOT NULL UNIQUE,
Owner_Name varchar(50) NOT NULL,
Address varchar(40) NOT NULL UNIQUE,
PRIMARY KEY(V_ID)
);

CREATE TABLE Order_Imports (
Import_ID int AUTO_INCREMENT, 
P_ID int NOT NULL, 
Date_info date NOT NULL, 
Total_Price float(15,3) NOT NULL,
PRIMARY KEY(Import_ID), 
FOREIGN KEY(P_ID) REFERENCES Producers (P_ID) ON DELETE CASCADE
);

CREATE TABLE Order_Exports (
Export_ID int AUTO_INCREMENT,
V_ID int NOT NULL,
Date_info date NOT NULL,
Total_Price float(15,3) NOT NULL,
PRIMARY KEY(Export_ID), 
FOREIGN KEY(V_ID) REFERENCES Vendors (V_ID) ON DELETE CASCADE
);

CREATE TABLE Import_Desc (
Import_ID int, 
SKU varchar(30), 
Amount int NOT NULL, 
PRIMARY KEY (Import_ID, SKU), 
FOREIGN KEY (Import_ID) REFERENCES Order_Imports(Import_ID) ON DELETE CASCADE, 
FOREIGN KEY (SKU) REFERENCES Products(SKU) ON DELETE CASCADE
);

CREATE TABLE Export_Desc (
Export_ID int, 
SKU varchar(30), 
Amount int NOT NULL, 
PRIMARY KEY (Export_ID, SKU), 
FOREIGN KEY (Export_ID) REFERENCES Order_Exports(Export_ID) ON DELETE CASCADE, 
FOREIGN KEY (SKU) REFERENCES Products(SKU) ON DELETE CASCADE
);
 

CREATE TABLE Dependants (
Staff_ID int,
dSin int NOT NULL,
d_Name varchar(30) NOT NULL,
Birthdate date NOT NULL,
PRIMARY KEY (Staff_ID),
FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) ON DELETE CASCADE
);

CREATE TABLE Quantify (
SKU varchar(30), 
Date_info date, 
Staff_ID int NOT NULL, 
PRIMARY KEY(Date_info, SKU), 
FOREIGN KEY (Staff_ID) REFERENCES Workers (Staff_ID) ON DELETE CASCADE, 
FOREIGN KEY (SKU) REFERENCES Products (SKU) ON DELETE CASCADE
);

CREATE TABLE Modify (
Date_info date, 
SKU varchar(30), 
Staff_ID int NOT NULL, 
PRIMARY KEY(Date_info,SKU),
FOREIGN KEY (Staff_ID) REFERENCES Manager (Staff_ID) ON DELETE CASCADE, 
FOREIGN KEY (SKU) REFERENCES Products (SKU) ON DELETE CASCADE
);

CREATE TABLE Oversees_Import(
P_ID int ,
Import_ID int,
Staff_ID int,
Status BIT DEFAULT 0 NOT NULL,
PRIMARY KEY(Import_ID, P_ID, Staff_ID),
FOREIGN KEY (P_ID) REFERENCES Producers (P_ID) ON DELETE CASCADE,
FOREIGN KEY (Import_ID) REFERENCES Order_Imports (Import_ID) ON DELETE CASCADE,
FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) ON DELETE 
CASCADE
);

CREATE TABLE Oversees_Export (
V_ID int, 
Export_ID int,
Staff_ID int,
Status BIT DEFAULT 0 NOT NULL,
PRIMARY KEY (V_ID, Export_ID, Staff_ID), 
FOREIGN KEY (V_ID) REFERENCES Vendors (V_ID) ON DELETE CASCADE,
FOREIGN KEY (Export_ID) REFERENCES Order_Exports (Export_ID) ON DELETE CASCADE,
FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID) ON DELETE CASCADE
);

create trigger TriggerTest AFTER UPDATE on Products FOR EACH ROW INSERT INTO Modify(SKU,Date_info,Staff_ID) values(NEW.SKU,CURDATE(),10);
