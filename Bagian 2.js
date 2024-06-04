/* Melakukan Sqoop Job pada tiga tabel yang telah kita buat sebelumnya ke Apache Hadoop HDFS */

/* 1a. Sqoop Job pada Tabel 'loan_info' */
sqoop job --create sqoop_loan_info -- import --connect jdbc:mysql://localhost/bank --username admin --password admin --table loan_info --target-dir /bank/loan_info_stg -m 1
/* 1b. Mengeksekusi Sqoop Job Tabel 'loan_info' */
sqoop job --exec sqoop_loan_info
/* 1c. Mengecek Tabel 'loan_info' pada Hadoop*/
hadoop fs -cat hdfs://localhost:9000/bank/loan_info_stg/*

/* 2a. Sqoop Job pada Tabel 'credit_card_info' */
sqoop job --create sqoop_credit_card_info -- import --connect jdbc:mysql://localhost/bank --username admin --password admin --table credit_card_info --target-dir /bank/credit_card_info_stg -m 1
/* 2b. Mengeksekusi Sqoop Job Tabel 'credit_card_info' */
sqoop job --exec sqoop_credit_card_info
/* 2c. Mengecek Tabel 'credit_card_info' pada Hadoop*/
hadoop fs -cat hdfs://localhost:9000/bank/credit_card_info_stg/*

/* 3a. Sqoop Job pada Tabel 'shares_info' */
sqoop job --create sqoop_shares_info -- import --connect jdbc:mysql://localhost/bank --username admin --password admin --table shares_info --target-dir /bank/shares_info_stg -m 1
/* 3b. Mengeksekusi Sqoop Job Tabel 'shares_info' */
sqoop job --exec sqoop_shares_info
/* 3c. Mengecek Tabel 'shares_info' pada Hadoop*/
hadoop fs -cat hdfs://localhost:9000/bank/shares_info_stg/*

/* Melihat Sqoop Jobs */
sqoop job --list
