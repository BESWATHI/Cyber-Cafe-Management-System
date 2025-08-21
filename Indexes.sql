CREATE INDEX idx_users_mobile ON Users(mobile_number);
CREATE INDEX idx_sessions_user ON Sessions(user_id);
CREATE INDEX idx_sessions_comp ON Sessions(computer_id);
CREATE INDEX idx_computers_status ON Computers(status);
