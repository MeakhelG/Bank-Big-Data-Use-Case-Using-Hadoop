/* Membuat Database Bank dan Mengisi data pada MySQL */

CREATE DATABASE BANK;
USE BANK;
  
CREATE TABLE `loan_info` (
  `loan_id` int NOT NULL,
  `user_id` int NOT NULL,
  `last_payment_date` date NOT NULL,
  `payment_instalation` int NOT NULL,
  `date_payable` date NOT NULL
);

INSERT INTO `loan_info` (`loan_id`, `user_id`, `last_payment_date`, `payment_instalation`, `date_payable`) VALUES
(1234, 5432, '2024-05-01', 234, '2024-05-13'),
(2005, 1020, '2024-03-25', 157, '2024-04-25'),
(2134, 5324, '2024-03-20', 289, '2024-04-10'),
(2191, 1045, '2024-03-20', 145, '2024-04-22'),
(2341, 5321, '2024-04-30', 245, '2024-05-13'),
(2567, 1234, '2024-03-06', 121, '2024-04-08'),
(2897, 1345, '2024-04-08', 129, '2024-05-08'),
(2957, 1657, '2024-04-11', 180, '2024-05-13'),
(3421, 5432, '2024-04-25', 276, '2024-05-08'),
(4321, 5123, '2024-04-08', 250, '2024-05-02');

CREATE TABLE `credit_card_info` (
  `user_id` int NOT NULL,
  `cc_number` double NOT NULL,
  `max_credit` int NOT NULL,
  `outstanding_balance` int NOT NULL,
  `due_date` date NOT NULL
);

INSERT INTO `credit_card_info` (`user_id`, `cc_number`, `max_credit`, `outstanding_balance`, `due_date`) VALUES
(1020, 123456789678, 50000, 35000, '2024-05-20'),
(1045, 185643837653, 500000, 300000, '2024-05-31'),
(1234, 107869543243, 150000, 50000, '2024-05-20'),
(1345, 128765976435, 100000, 40000, '2024-05-28'),
(1657, 123435465768, 200000, 100000, '2024-05-27');

CREATE TABLE `shares_info` (
  `share_id` int NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `share_price` int NOT NULL
);

INSERT INTO `shares_info` (`share_id`, `company_name`, `timestamp`, `share_price`) VALUES
(100, 'AnneCorp', '2024-05-05 17:00:00', 80),
(102, 'FlyCorp', '2024-04-15 17:00:00', 100),
(109, 'BoboCorp', '2024-04-30 17:00:00', 110),
(140, 'YouCorp', '2024-04-29 17:00:00', 100),
(201, 'MyCorp', '2024-05-01 17:00:00', 120);

COMMIT;

/* Mengecek data pada database bank di MySQL */
SELECT * FROM loan_info;
SELECT * FROM credit_card_info;
SELECT * FROM shares_info;

/* Membuat user baru pada MySQL */
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
COMMIT;
