/* Mengenkripsi data pada Apache Hive */

ADD jar /home/meakhelg/encryption_hive.jar;
CREATE TEMPORARY FUNCTION encrypt AS 'AESencrypt';
CREATE TEMPORARY FUNCTION decrypt AS 'AESdecrypt';

CREATE TABLE loan_info (
    loan_id string,
    user_id string,
    last_payment_date string,
    payment_instalation string,
    date_payable string
) STORED AS ORC;

INSERT INTO TABLE loan_info SELECT 
    encrypt(loan_id),
    encrypt(user_id),
    encrypt(last_payment_date),
    encrypt(payment_instalation),
    encrypt(date_payable)
FROM loan_info_stg;

CREATE TABLE credit_card_info (
    user_id string,
    cc_number string,
    max_credit string,
    outstanding_balance string,
    due_date string
) STORED AS ORC;

INSERT INTO TABLE credit_card_info SELECT
    encrypt(user_id),
    encrypt(cc_number),
    encrypt(max_credit),
    encrypt(outstanding_balance),
    encrypt(due_date)
FROM credit_card_info_stg;

CREATE TABLE shares_info (
    share_id string,
    company_name string,
    `timestamp` string,
    share_price string
) STORED AS ORC; 

INSERT INTO TABLE shares_info SELECT
    encrypt(share_id),
    encrypt(company_name),
    encrypt(`timestamp`),
    encrypt(share_price)
FROM shares_info_stg; 

/* Mengecek data pada database bank di Apache Hive*/
SELECT * FROM loan_info;
SELECT * FROM credit_card_info;
SELECT * FROM shares_info;

/* Melihat isi dari loan_info dengan fungsi decrypt */
SELECT 
    decrypt(loan_id),
    decrypt(user_id),
    decrypt(last_payment_date),
    decrypt(payment_instalation),
    decrypt(date_payable)
FROM loan_info;

/* Melihat isi dari credit_card_info dengan fungsi decrypt */
SELECT
    decrypt(user_id),
    decrypt(cc_number),
    decrypt(max_credit),
    decrypt(outstanding_balance),
    decrypt(due_date)
FROM credit_card_info;

/* Melihat isi dari shares_info dengan fungsi decrypt */
SELECT
    decrypt(share_id),
    decrypt(company_name),
    decrypt(`timestamp`),
    decrypt(share_price)
FROM shares_info; 
