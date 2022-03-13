CREATE TABLE Car (
carMake TEXT NOT NULL,
carModel TEXT NOT NULL,
carYear INTEGER NOT NULL,
dailyCost INTEGER NOT NULL,
kmCost REAL NOT NULL,
PRIMARY KEY(carMake, carModel, carYear)
);

CREATE TABLE Vehicle (
carMake TEXT NOT NULL,
carModel TEXT NOT NULL,
carYear INTEGER NOT NULL,
VIN TEXT NOT NULL PRIMARY KEY
	CHECK(
		VIN GLOB '[A-Z0-9][A-Z0-9][X0-9][A-Z0-9][A-Z0-9]' AND
		VIN GLOB '[^IOQ][^IOQ]?[^IOQ][^IOQ]'
		),
odometer INTEGER
);

CREATE TABLE rental (
customerId INTEGER NOT NULL,
VIN TEXT NOT NULL,
odo_out INTEGER,
odo_back INTEGER,
date_out TEXT,
date_back TEXT,
FOREIGN KEY(customerId) REFERENCES Customer(id) ON UPDATE CASCADE,
FOREIGN KEY(VIN) REFERENCES Vehicle(VIN)
);

CREATE TABLE Customer (
id INTEGER NOT NULL PRIMARY KEY,
name TEXT NOT NULL,
email TEXT NOT NULL
);