/* Perintah ini mengambil nilai user_id dari tabel loan_info setelah mendekripsi kolom last_payment_date, 
dan hanya memilih baris di mana selisih tanggal lebih dari atau sama dengan 60 hari. */
SELECT decrypt(user_id)
FROM loan_info
WHERE datediff(from_unixtime(unix_timestamp(), 'yyyy-MM-dd'), decrypt(last_payment_date)) >= 60;

/* Perintah SQL di atas mengambil user_id dari tabel loan_info yang di-join dengan tabel credit_card_info 
berdasarkan user_id yang telah didekripsi. Hasilnya hanya mencakup data di mana outstanding_balance pada 
tabel credit_card_info adalah 35000.0 atau lebih, dan last_payment_date pada tabel loan_info terjadi 30 hari 
atau lebih sebelum tanggal saat ini. */
SELECT decrypt(li.user_id)
FROM loan_info li INNER JOIN credit_card_info cci 
ON decrypt(li.user_id) = decrypt(cci.user_id)
WHERE CAST(decrypt(cci.outstanding_balance) AS double) = 35000.0
AND datediff(from_unixtime(unix_timestamp(), 'yyyy-MM-dd'), decrypt(li.last_payment_date))>=30;

/* Melihat isi dari loan_info dengan fungsi decrypt */
INSERT INTO TABLE loan_info SELECT 
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

/* Tambahan */
SELECT decrypt(share_id), decrypt(company_name), decrypt(`timestamp`), decrypt(share_price) FROM shares_info WHERE decrypt(share_id) = 300;
