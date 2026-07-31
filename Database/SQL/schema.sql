CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE Builders (
    builder_id SERIAL PRIMARY KEY,
    builder_name VARCHAR(200),
    contact_email VARCHAR(255)
);

CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    builder_id INT REFERENCES Builders(builder_id),
    property_name VARCHAR(255),
    location VARCHAR(255),
    price DECIMAL(12,2)
);

CREATE TABLE Leads (
    lead_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    property_id INT REFERENCES Properties(property_id),
    status VARCHAR(50)
);

CREATE TABLE Visits (
    visit_id SERIAL PRIMARY KEY,
    lead_id INT REFERENCES Leads(lead_id),
    visit_date DATE
);

CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    property_id INT REFERENCES Properties(property_id),
    amount DECIMAL(12,2)
);

CREATE TABLE Subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    builder_id INT REFERENCES Builders(builder_id),
    plan VARCHAR(100)
);

CREATE TABLE Documents (
    document_id SERIAL PRIMARY KEY,
    property_id INT REFERENCES Properties(property_id),
    document_name VARCHAR(255)
);
