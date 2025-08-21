INSERT INTO Admin (admin_name, username, password_hash, mobile_number, email)
VALUES ('Test Admin','admin', SHA2('Admin@123',256), '8979555556', 'test@gmail.com');

INSERT INTO Computers (computer_name, computer_location, ip_address, hourly_rate)
VALUES ('PC-01','Front Desk','192.168.1.10', 1.50),
       ('PC-02','Back Room','192.168.1.11', 2.00);
INSERT INTO Computers (computer_name, computer_location, ip_address, hourly_rate, status)
VALUES
  ('PC-03','VIP Room','192.168.1.12', 3.50, 'available'),
  ('PC-04','Corner Window','192.168.1.13', 1.75, 'available'),
  ('PC-05','Kids Zone','192.168.1.14', 1.00, 'available'),
  ('PC-06','Back Room','192.168.1.15', 2.25, 'maintenance'),
  ('PC-07','Tutorial Desk','192.168.1.16', 2.00, 'available'),
  ('PC-08','Front Desk 2','192.168.1.17', 1.80, 'occupied'),
  ('PC-09','Gaming Area','192.168.1.18', 4.50, 'available'),
  ('PC-10','Conference Room','192.168.1.19', 5.00, 'available');
       

INSERT INTO Users (entry_id, user_name, user_address, mobile_number, email, id_proof)
VALUES ('ENT001','Alice Kumar','Some Street, City','9876543210','alice@mail.com','Aadhar-XXXX'),
       ('ENT002','Bob Rao','Another Address','9988776655','bob@mail.com','DL-YYYY');
       
INSERT INTO Users (entry_id, user_name, user_address, mobile_number, email, id_proof)
VALUES
  ('ENT003','Deepa R','12 Park St, Central City','9123000001','deepa@example.com','Aadhar-3333'),
  ('ENT004','Karan V','45 Lake Rd, West End','9123000002','karan@example.com','DL-4444'),
  ('ENT005','Sneha M','78 Hill Ave, North Town','9123000003','sneha@example.com','PP-5555'),
  ('ENT006','Arjun P','9 River Walk, East Side','9123000004','arjun@example.com','Aadhar-6666'),
  ('ENT007','Nisha S','22 Market Lane, Old City','9123000005','nisha@example.com','DL-7777'),
  ('ENT008','Rohit K','101 Sunrise Blvd, Midtown','9123000006','rohit@example.com','PP-8888'),
  ('ENT009','Priya L','7 Lotus Park, South Park','9123000007','priya@example.com','Aadhar-9999'),
  ('ENT010','Sameer T','55 Palm St, Downtown','9123000008','sameer@example.com','DL-0000');
  
  
SELECT user_id, entry_id, user_name FROM Users ORDER BY user_id DESC LIMIT 10;
SELECT computer_id, computer_name, status, hourly_rate FROM Computers ORDER BY computer_id DESC LIMIT 10;



