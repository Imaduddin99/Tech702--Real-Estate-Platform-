-- Validation Query 1
-- Display properties along with their builder information

SELECT
    p.property_id,
    p.property_name,
    p.location,
    p.price,
    b.builder_name
FROM properties p
JOIN builders b
    ON p.builder_id = b.builder_id;

-- Validate users, leads, and properties relationship
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_name,
    l.status
FROM users u
JOIN leads l
    ON u.user_id = l.user_id
JOIN properties p
    ON l.property_id = p.property_id;