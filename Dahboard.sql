-- total number of users (registered)
SELECT COUNT(*) AS total_users FROM Users;

-- total computers
SELECT COUNT(*) AS total_computers FROM Computers;

-- computers currently occupied
SELECT COUNT(*) AS occupied FROM Computers WHERE status = 'occupied';

-- todays sessions started
SELECT COUNT(*) AS sessions_today
FROM Sessions
WHERE DATE(in_time) = CURDATE();

-- today's revenue
SELECT COALESCE(SUM(fee),0) AS revenue_today
FROM Sessions
WHERE DATE(out_time) = CURDATE();
