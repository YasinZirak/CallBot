
/*******************************************************************************
   Mydb Database - Version 0.0
   Script: Mydb.sql
   Description: Creates and populates the Mydb database.
   DB Server: Sqlite
   Author: Zwinny AB 
   License: ""
********************************************************************************/



/*******************************************************************************
   Drop Tables
********************************************************************************/
DROP TABLE IF EXISTS [MediaType];
DROP TABLE IF EXISTS [Artist];
DROP TABLE IF EXISTS [CarRentalData];


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE [MediaType]
(
    [MediaTypeId] INTEGER  NOT NULL,
    [Name] NVARCHAR(120),
    CONSTRAINT [PK_MediaType] PRIMARY KEY  ([MediaTypeId])
);

CREATE TABLE [CarRentalData] (
    id SERIAL PRIMARY KEY,
    fuelType VARCHAR(255),
    rating DECIMAL(3, 2),
    renterTripsTaken INT,
    reviewCount INT,
    location_city VARCHAR(255),
    location_country VARCHAR(255),
    location_latitude DECIMAL(10, 6),
    location_longitude DECIMAL(10, 6),
    location_state VARCHAR(255),
    owner_id INT,
    rate_daily DECIMAL(7, 2),
    vehicle_make VARCHAR(255),
    vehicle_model VARCHAR(255),
    vehicle_type VARCHAR(255),
    vehicle_year INT
);

/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
/*CREATE INDEX [IFK_AlbumArtistId] ON [Album] ([ArtistId]);

CREATE INDEX [IFK_CustomerSupportRepId] ON [Customer] ([SupportRepId]);*/


/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO [MediaType] ([MediaTypeId], [Name]) VALUES (1, 'MPEG audio file');
INSERT INTO [MediaType] ([MediaTypeId], [Name]) VALUES (2, 'Protected AAC audio file');
INSERT INTO [MediaType] ([MediaTypeId], [Name]) VALUES (3, 'Protected MPEG-4 video file');
INSERT INTO [MediaType] ([MediaTypeId], [Name]) VALUES (4, 'Purchased AAC audio file');
INSERT INTO [MediaType] ([MediaTypeId], [Name]) VALUES (5, 'AAC audio file');


INSERT INTO CarRentalData (
    fuelType, rating, renterTripsTaken, reviewCount,
    location_city, location_country, location_latitude, location_longitude, location_state,
    owner_id, rate_daily, vehicle_make, vehicle_model, vehicle_type, vehicle_year
) VALUES
('ELECTRIC', 5, 13, 12, 'Seattle', 'US', 47.449107, -122.308841, 'WA', 12847615, 135, 'Tesla', 'Model X', 'suv', 2019),
('ELECTRIC', 5, 2, 1, 'Tijeras', 'US', 35.11106, -106.276551, 'NM', 15621242, 190, 'Tesla', 'Model X', 'suv', 2018),
('HYBRID', 4.92, 28, 24, 'Albuquerque', 'US', 35.127163, -106.566681, 'NM', 10199256, 35, 'Toyota', 'Prius', 'car', 2012),
('GASOLINE', 5, 21, 20, 'Albuquerque', 'US', 35.149726, -106.711425, 'NM', 9365496, 75, 'Ford', 'Mustang', 'car', 2018),
('GASOLINE', 5, 3, 1, 'Albuquerque', 'US', 35.208659, -106.601008, 'NM', 3553565, 47, 'Chrysler', 'Sebring', 'car', 2010),
('GASOLINE', 5, 13, 12, 'Albuquerque', 'US', 35.068834, -106.576111, 'NM', 7815747, 58, 'Mercedes-Benz', 'GL-Class', 'suv', 2012),
('GASOLINE', 4.42, 13, 12, 'Albuquerque', 'US', 35.045552, -106.633815, 'NM', 3112016, 42, 'GMC', 'Yukon XL', 'suv', 2005),
('GASOLINE', 4.9, 12, 10, 'Albuquerque', 'US', 35.186542, -106.686481, 'NM', 9536762, 117, 'Ford', 'Expedition', 'suv', 2018),
('GASOLINE', 5, 1, 1, 'Albuquerque', 'US', 35.061213, -106.629406, 'NM', 14893743, 102, 'Ford', 'Focus RS', 'car', 2016),
('GASOLINE', 4.76, 22, 17, 'Albuquerque', 'US', 35.115363, -106.556911, 'NM', 11389136, 49, 'Ford', 'EcoSport', 'suv', 2018),
('GASOLINE', 4.95, 23, 22, 'Albuquerque', 'US', 35.148891, -106.71102, 'NM', 9365496, 75, 'Ford', 'F-150', 'truck', 2012),
('HYBRID', 4.7, 11, 10, 'Albuquerque', 'US', 35.121564, -106.598445, 'NM', 10199256, 35, 'Toyota', 'Prius', 'car', 2012),
('GASOLINE', 5, 11, 7, 'Albuquerque', 'US', 35.078547, -106.497368, 'NM', 9346980, 88, 'Volkswagen', 'Tiguan', 'suv', 2018),
('HYBRID', 4.92, 51, 38, 'Albuquerque', 'US', 35.186381, -106.727808, 'NM', 3070318, 42, 'Toyota', 'Avalon Hybrid', 'car', 2013),
('GASOLINE', 4.88, 61, 56, 'Albuquerque', 'US', 35.161777, -106.535379, 'NM', 3092621, 42, 'Saab', '3-Sep', 'car', 2011),
('GASOLINE', 4.5, 2, 2, 'Albuquerque', 'US', 35.108365, -106.598589, 'NM', 14428787, 65, 'Ram', 'CV Tradesman', 'minivan', 2014);
