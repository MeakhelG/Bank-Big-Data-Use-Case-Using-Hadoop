/* Perintah ini mengambil nilai user_id dari tabel loan_info setelah mendekripsi kolom last_payment_date, 
dan hanya memilih baris di mana selisih tanggal lebih dari atau sama dengan 20 hari. */
SELECT decrypt(user_id)
FROM loan_info
WHERE datediff(from_unixtime(unix_timestamp(), 'yyyy-MM-dd'), decrypt(last_payment_date)) >= 20;

/* Perintah SQL di atas mengambil user_id dari tabel loan_info yang di-join dengan tabel credit_card_info 
berdasarkan user_id yang telah didekripsi. Hasilnya hanya mencakup data di mana outstanding_balance pada 
tabel credit_card_info adalah 300000.0 atau lebih, dan last_payment_date pada tabel loan_info terjadi 15 hari 
atau lebih sebelum tanggal saat ini. */
SELECT decrypt(li.user_id)
FROM loan_info li INNER JOIN credit_card_info cci 
ON decrypt(li.user_id) = decrypt(cci.user_id)
WHERE CAST(decrypt(cci.outstanding_balance) AS double) >= 300000.0
AND datediff(from_unixtime(unix_timestamp(), 'yyyy-MM-dd'), decrypt(li.last_payment_date))>=15;

/* Perintah ini mengambil data dari tabel shares_info setelah mendekripsi kolom-kolom tertentu dan
hanya memilih baris dimana share_id bernilai 300. */
SELECT decrypt(share_id), decrypt(company_name), decrypt(`timestamp`), decrypt(share_price) 
FROM shares_info WHERE decrypt(share_id) = 300;
