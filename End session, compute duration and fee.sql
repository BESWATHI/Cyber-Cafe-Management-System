-- Method: compute using computer.hourly_rate and in_time/out_time
UPDATE Sessions s
JOIN Computers c ON s.computer_id = c.computer_id
SET s.out_time = NOW(),
    s.duration_minutes = TIMESTAMPDIFF(MINUTE, s.in_time, NOW()),
    s.fee = ROUND( (TIMESTAMPDIFF(SECOND, s.in_time, NOW()) / 3600) * c.hourly_rate, 2 )
WHERE s.session_id = 123 AND s.out_time IS NULL;

-- Mark computer back to available
UPDATE Computers SET status = 'available' WHERE computer_id = 1;
