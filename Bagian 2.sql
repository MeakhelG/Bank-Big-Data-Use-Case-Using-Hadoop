/* Membuat user baru pada MySQL*/

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
COMMIT;

/* Membuat user baru pada MySQL*/

sqoop job --create sqoop_loan_info -- import --connect jdbc:mysql://localhost/bank --username meakhelg --password meakhelg --table loan_info --target-dir /bank/loan_info_stg -m 1
hadoop fs -cat hdfs://localhost:9000/bank/loan_info_stg/*
sqoop job --create sqoop_credit_card_info -- import --connect jdbc:mysql://localhost/bank --username meakhelg --password meakhelg --table credit_card_info --target-dir /bank/credit_card_info_stg -m 1
hadoop fs -cat hdfs://localhost:9000/bank/credit_card_info_stg/*
sqoop job --create sqoop_shares_info -- import --connect jdbc:mysql://localhost/bank --username meakhelg --password meakhelg --table shares_info --target-dir /bank/shares_info_stg -m 1
hadoop fs -cat hdfs://localhost:9000/bank/shares_info_stg/*
