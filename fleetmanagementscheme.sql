-- CREATE DATABASE fleetmsdb;
USE fleetmsdb;

-- Write SQL queries to insert the provided records into their respective tables.

CREATE TABLE vehicles(
vehicle_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
license_plate VARCHAR(50) NOT NULL,
vehicle_make VARCHAR(50) NOT NULL,  
car_Model VARCHAR(100) NOT NULL,
year_of_manufacture year NOT NULL,
color VARCHAR(50) NOT NULL,
VIN VARCHAR(100)
);

INSERT INTO vehicles(license_plate, vehicle_make, car_model, year_of_manufacture, color, VIN)
  VALUES("ABC123", "Toyota", "Corolla", 2020, "White", "1HGCM82633A004352"),
  ("XYZ789", "Ford", "Fusion", 2018, "Blue", "2HGCM82633A004353");
  
CREATE TABLE drivers(
driver_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
license_number VARCHAR(100) NOT NULL,
phone_number INT NOT NULL,
address VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
state VARCHAR(50) NOT NULL,
zipcode INT NOT NULL
);

INSERT INTO drivers(first_name, last_name, license_number, phone_number, address, city, state, zipcode)
  VALUES("Michael", "Smith", "D1234567", "1234567890", "123 Main St", "Anytown", "CA", "12345"),
  ("Sarah", "Connor", "D7654321", "0987654321", "456 Elm St", "Otherville", "NY", "54321");
 
CREATE TABLE trips(
trip_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
driver_id INT, FOREIGN KEY(driver_id) REFERENCES drivers(driver_id),
vehicle_id INT, FOREIGN KEY(vehicle_id) REFERENCES vehicles(vehicle_id),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
start_location VARCHAR(30) NOT NULL,
end_location VARCHAR(30) NOT NULL,
distance INT NOT NULL
);

INSERT INTO trips(vehicle_id, driver_id , start_date, end_date, start_location, end_location, distance)
  VALUES(1, 1, '2024-07-01', '2024-07-02', "Los Angeles", "San Francisco", 380),
  (2, 2, '2024-07-03', '2024-07-04', "New York", "Washington D.C.", 225);

CREATE TABLE maintenance(
maintenance_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
vehicle_id INT NOT NULL, FOREIGN KEY(vehicle_id) REFERENCES vehicles(vehicle_id),
Maintenance_Date DATE NOT NULL,
Description TEXT,
maintenance_cost INT NOT NULL
);

INSERT INTO maintenance(vehicle_id , Maintenance_Date, Description, maintenance_cost)
  VALUES(1, '2024-06-15', "Oil change", 50.00),
  (2, '2024-06-20', "Tire replacement", 300.00);
  
  -- Update the cost of the second maintenance record to 350.00.
  UPDATE maintenance
  SET maintenance_cost = 350.00
  WHERE maintenance_date = '2024-06-20';
  
-- Delete the first vehicle from the Vehicles table.
DELETE FROM vehicles
WHERE vehicle_id = 1;

-- Insert one more record into the Trips table with the following details: (VehicleID: 2, DriverID: 1, StartDate: '2024-07-05' EndDate: '2024-07-06', StartLocation: "Boston", EndLocation: "Philadelphia", Distance: 300)
INSERT INTO trips(vehicle_id, driver_id , start_date, end_date, start_location, end_location, distance)
VALUES(2, 1, '2024-07-05', '2024-07-06', "Boston", "Philadelphia", 300);

-- Update the color of the second vehicle in the Vehicles table to "Red".
UPDATE vehicles
SET color = "Red"
WHERE vehicle_make = "Ford"
; 

-- Insert a new maintenance record into the Maintenance table with the following details: (VehicleID: 1, MaintenanceDate: '2024-07-10', Description: "Brake inspection" Cost: 100.00)
INSERT INTO maintenance(vehicle_id , Maintenance_Date, Description, maintenance_cost)
VALUES(1, '2024-07-10', "Brake inspection", 100.00);

-- Update the phone number of the first driver in the Drivers table to "2223334444".
UPDATE drivers
SET phone_number = "2223334444"
WHERE driver_id = 1;

-- Delete the trip with TripID = 2 from the Trips table.
DELETE FROM trips
WHERE trip_id = 2;

