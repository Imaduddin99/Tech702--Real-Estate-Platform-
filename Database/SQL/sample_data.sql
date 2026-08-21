
-- Users
INSERT INTO Users (first_name, last_name, email, phone)
VALUES
('John', 'Smith', 'john.smith@example.com', '3095551001'),
('Sarah', 'Johnson', 'sarah.johnson@example.com', '3095551002'),
('Michael', 'Brown', 'michael.brown@example.com', '3095551003');


-- Builders
INSERT INTO Builders (builder_name, contact_email)
VALUES
('Green Homes LLC', 'contact@greenhomes.com'),
('Urban Developers', 'info@urbandevelopers.com');


-- Properties
INSERT INTO Properties (builder_id, property_name, location, price)
VALUES
(1, 'Green Valley Apartments', 'Peoria, IL', 250000.00),
(1, 'Lake View Homes', 'Bloomington, IL', 320000.00),
(2, 'Downtown Residency', 'Chicago, IL', 450000.00);

-- Sample Leads
INSERT INTO leads (user_id, property_id, status)
VALUES
(1, 1, 'Interested'),
(2, 2, 'Contacted'),
(3, 3, 'Scheduled');