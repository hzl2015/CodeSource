mysqldump --default-character-set=utf8 --lock-all-tables --opt --skip-dump-date --add-drop-database --add-drop-table -R -d -h 127.0.0.1 -u root -proot --databases test_1 > ./test_1_status.sql
