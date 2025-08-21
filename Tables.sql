-- Admin table
CREATE TABLE Admin (
  admin_id INT AUTO_INCREMENT PRIMARY KEY,                 -- PK (Primary Key)
  admin_name VARCHAR(100) NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,                    -- store hashed password
  mobile_number VARCHAR(20),
  email VARCHAR(150),
  admin_reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Computers table
CREATE TABLE Computers (
  computer_id INT AUTO_INCREMENT PRIMARY KEY,
  computer_name VARCHAR(100) NOT NULL UNIQUE,
  computer_location VARCHAR(150),
  ip_address VARCHAR(45),
  entry_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  hourly_rate DECIMAL(8,2) DEFAULT 0.00,                  -- price per hour
  status ENUM('available','occupied','maintenance') DEFAULT 'available'
) ENGINE=InnoDB;

-- Users table (registered patrons)
CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  entry_id VARCHAR(50) UNIQUE,                             -- external id if any
  user_name VARCHAR(150) NOT NULL,
  user_address TEXT,
  mobile_number VARCHAR(20),
  email VARCHAR(150),
  id_proof VARCHAR(100),                                   -- e.g., passport/adhaar
  registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  status ENUM('active','inactive','banned') DEFAULT 'active',
  remark TEXT
) ENGINE=InnoDB;

-- Sessions table: tracks login/in/out and billing per session
CREATE TABLE Sessions (
  session_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  computer_id INT NOT NULL,
  in_time DATETIME NOT NULL,
  out_time DATETIME DEFAULT NULL,
  duration_minutes INT DEFAULT NULL,                       -- cached duration
  fee DECIMAL(10,2) DEFAULT NULL,                         -- computed fee
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_session_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  CONSTRAINT fk_session_computer FOREIGN KEY (computer_id) REFERENCES Computers(computer_id) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Optional: payments / bills table if you want persistent payment records
CREATE TABLE Payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  session_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('cash','card','upi','other') DEFAULT 'cash',
  CONSTRAINT fk_payment_session FOREIGN KEY (session_id) REFERENCES Sessions(session_id) ON DELETE CASCADE
) ENGINE=InnoDB;


commit;