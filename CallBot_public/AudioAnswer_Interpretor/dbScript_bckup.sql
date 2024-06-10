
drop table if exists movie;
drop table if exists person;
drop table if exists CarRentalData;



CREATE TABLE CarRentalData (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    fuel_type VARCHAR(255),
    rating DECIMAL(4, 2),
    review_count INT,
    location_city VARCHAR(255),
    location_country VARCHAR(255),
    Price_perDay INT,
    vehicle_make VARCHAR(255),
    vehicle_model VARCHAR(255),
    vehicle_type VARCHAR(255),
    vehicle_year INT,
    weekend_available VARCHAR(3),
    color VARCHAR(255)
);



INSERT INTO CarRentalData (
    fuel_type,
    rating,
    review_count,
    location_city,
    location_country,
    Price_perDay,
    vehicle_make,
    vehicle_model,
    vehicle_type,
    vehicle_year,
    weekend_available,
    color
)
VALUES
    ('ELECTRIC', 5, 12, 'Seattle', 'US', 135, 'Tesla', 'Model X', 'suv', 2019, 'yes', 'dark blue'),
    ('ELECTRIC', 5, 1, 'Tijeras', 'US', 190, 'Tesla', 'Model X', 'suv', 2018, 'Yes', 'black'),
    ('ELECTRIC', 4.92, 24, 'Albuquerque', 'US', 35, 'Toyota', 'Prius', 'car', 2012, 'yes', 'black'),
    ('GASOLINE', 5, 20, 'Albuquerque', 'US', 75, 'Ford', 'Mustang', 'car', 2018, 'yes', 'black'),
    ('GASOLINE', 5, 1, 'Albuquerque', 'US', 47, 'Chrysler', 'Sebring', 'car', 2010, 'yes', 'red'),
    ('GASOLINE', 5, 12, 'Albuquerque', 'US', 58, 'Mercedes-Benz', 'GL-Class', 'suv', 2012, 'yes', 'yellow'),
    ('GASOLINE', 4.42, 12, 'Albuquerque', 'US', 42, 'GMC', 'Yukon XL', 'suv', 2005, 'yes', 'green'),
    ('GASOLINE', 5, 12, 'Albuquerque', 'US', 58, 'Mercedes-Benz', 'GL-Class', 'suv', 2012, 'yes', 'white'),
    ('GASOLINE', 5, 19, 'Augusta', 'US', 87, 'Mercedes-Benz', 'GLC-Class', 'convertible', 2016, 'yes', 'dark blue'),
    ('GASOLINE', 5, 10, 'Grayson', 'US', 175, 'Mercedes-Benz', 'S-Class', 'convertible', 2015, 'no', 'dark blue'),
    ('GASOLINE', 5, 2, 'Atlanta', 'US', 200, 'BMW', '7 Series', 'convertible', 2018, 'yes', 'black'),
    ('GASOLINE', 4.93, 14, 'Atlanta', 'US', 98, 'Mercedes-Benz', 'C-Class', 'convertible', 2019, 'no', 'black'),
    ('GASOLINE', NULL, 0, 'Tampa', 'US', 96, 'BMW', '4 Series', 'convertible', 2018, 'no', 'black'),
    ('GASOLINE', 4.85, 110, 'Doraville', 'US', 99, 'Mercedes-Benz', 'GLA-Class', 'suv', 2017, 'no', 'red'),
    ('GASOLINE', 4.95, 40, 'Douglasville', 'US', 84, 'Mercedes-Benz', 'C-Class', 'convertible', 2015, 'no', 'yellow'),
    ('GASOLINE', 4.83, 6, 'Atlanta', 'US', 189, 'Mercedes-Benz', 'S-Class', 'car', 2016, 'no', 'green'),
    ('GASOLINE', 4.95, 66, 'East Point', 'US', 90, 'Mercedes-Benz', 'E-Class', 'convertible', 2016, 'no', 'white'),
    ('GASOLINE', 5, 16, 'Decatur', 'US', 78, 'BMW', 'Z4', 'car', 2008, 'yes', 'dark blue'),
    ('GASOLINE', 5, 2, 'Atlanta', 'US', 98, 'BMW', 'X4', 'suv', 2018, 'yes', 'dark blue'),
    ('GASOLINE', 4.98, 44, 'Atlanta', 'US', 149, 'BMW', '6 Series Gran Coupe', 'car', 2013, 'yes', 'red'),
    ('GASOLINE', 5, 62, 'Atlanta', 'US', 195, 'BMW', 'M4', 'car', 2015, 'yes', 'yellow'),
    ('GASOLINE', 5, 13, 'Alpharetta', 'US', 130, 'Mercedes-Benz', 'C-Class', 'convertible', 2016, 'yes', 'green'),
    ('GASOLINE', NULL, 0, 'Atlanta', 'US', 70, 'Mercedes-Benz', 'GLA-Class', 'suv', 2015, 'yes', 'white'),
    ('GASOLINE', 5, 31, 'Atlanta', 'US', 65, 'Mercedes-Benz', 'C-Class', 'car', 2016, 'yes', 'dark blue'),
    ('GASOLINE', 5, 14, 'Smyrna', 'US', 180, 'BMW', 'M4', 'convertible', 2016, 'yes', 'red'),
    ('GASOLINE', 5, 13, 'Atlanta', 'US', 64, 'BMW', '5 Series', 'car', 2011, 'yes', 'yellow'),
    ('GASOLINE', 4.93, 61, 'Fairburn', 'US', 299, 'BMW', 'i8', 'car', 2015, 'yes', 'green'),
    ('GASOLINE', 5, 2, 'Grayson', 'US', 98, 'Mercedes-Benz', 'E-Class', 'car', 2017, 'no', 'white');

