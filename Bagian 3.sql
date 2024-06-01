/* Membuat Database Bank dan tabel eksternal pada Apache Hive */
CREATE DATABASE BANK;
USE BANK;

CREATE EXTERNAL TABLE loan_info_stg (
    loan_id int,
    user_id int,
    last_payment_date string,
    payment_instalation double,
    date_payable string
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/bank/loan_info_stg';

CREATE EXTERNAL TABLE credit_card_info_stg (
    user_id int,
    cc_number string,
    max_credit double,
    outstanding_balance double,
    due_date string
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/bank/credit_card_info_stg';

CREATE EXTERNAL TABLE shares_info_stg (
    share_id string,
    company_name string,
    `timestamp` timestamp,
    share_price double
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/bank/shares_info_stg';

