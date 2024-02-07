Microsoft Windows [Version 10.0.22635.3139]
(c) Microsoft Corporation. All rights reserved.

C:\Users\salah>mysql -u root -p
Enter password: **************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 34
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bdtest             |
| centreformation    |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
10 rows in set (0.01 sec)

mysql> USE bdtest;
Database changed
mysql> SHOW CREATE DATABASE bdtest;
+----------+----------------------------------------------------------------------------------------------------------------------------------+
| Database | Create Database
                                                                      |
+----------+----------------------------------------------------------------------------------------------------------------------------------+
| bdtest   | CREATE DATABASE `bdtest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+----------+----------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> USE bdtest;
Database changed
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bdtest             |
| centreformation    |
| information_schema |
| mysql              |
| performance_schema |
| players            |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
10 rows in set (0.00 sec)

mysql> DROP DATABASE bdtest;
Query OK, 6 rows affected (0.16 sec)

mysql> EXIT;
Bye