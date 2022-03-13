CREATE VIEW CustomerSummary AS 
SELECT customerId, date_out AS rental_date_out, date_back AS rental_date_back, ((julianday(date_back) - julianday(date_out)) * dailyCost + (odo_back - odo_out) * kmCost) AS rental_cost
FROM rental r 
JOIN Vehicle v on r.VIN = v.VIN
JOIN Car c on c.carMake = v.carMake AND c.carModel = v.carModel AND c.carYear = v.carYear
WHERE date_back IS NOT NULL;
