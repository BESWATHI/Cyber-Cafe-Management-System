-- 1) mark computer occupied
UPDATE Computers SET status = 'occupied' WHERE computer_id = 1 AND status = 'available';

-- 2) insert session start
INSERT INTO Sessions (user_id, computer_id, in_time)
VALUES (1, 1, NOW());
