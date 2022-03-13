CREATE TRIGGER set_odo AFTER INSERT ON rental
BEGIN
	UPDATE rental SET odo_out = (SELECT Vehicle.odometer FROM Vehicle WHERE Vehicle.VIN = NEW.VIN) WHERE VIN = NEW.VIN;
END;

CREATE TRIGGER update_odo AFTER UPDATE ON rental
WHEN NEW.date_back IS NOT NULL
BEGIN	
	UPDATE Vehicle SET odometer = (SELECT rental.odo_back FROM rental WHERE rental.VIN = Vehicle.VIN) WHERE VIN = NEW.VIN;
END;