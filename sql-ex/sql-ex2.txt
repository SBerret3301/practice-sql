Microsoft Windows [Version 10.0.22635.3139]
(c) Microsoft Corporation. All rights reserved.

C:\Users\salah>mysql -u root -p
Enter password: **************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 35
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
9 rows in set (0.01 sec)

mysql> create database centre_formation;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW CREATE DATABASE centre_formation;
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------+
| Database         | Create Database

                |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------+
| centre_formation | CREATE DATABASE `centre_formation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
+------------------+--------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
mysql> create database centre_formation;
Query OK, 1 row affected (0.01 sec)

mysql> use centre_formation;
Database changed
mysql> create table ETUDIANT(
    -> nom_CINEtu VARCHAR(10),
    -> nomEtu VARCHAR(45),
    -> prenomEtu VARCHAR(45),
    -> dateNaissance DATE,
    -> adressEtu VARCHAR(45),
    -> villeEtu VARCHAR(45),
    -> niveauEtu VARCHAR(45)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table Inscription(
    -> codeSess INT,
    -> nom_CINEtu VARCHAR(10),
    -> typeCours VARCHAR(45)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create table SESSION(
    -> codeSess INT,
    -> nomSess VARCHAR(45),
    -> dateDebut DATE,
    -> dateFin VARCHAR(45)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create table Formation(
    -> codeForm INT,
    -> titreForm VARCHAR(45),
    -> dureeForm DOUBLE,
    -> prixForm DOUBLE,
    -> SESSION_codeSess INT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> create table Catalogue(
    -> codeSpec INT,
    -> codeForm INT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table SPECIALITE(
    -> codeSpec INT,
    -> nomSpec VARCHAR(45),
    -> descSpec VARCHAR(45)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> alter table Inscription
    -> modify typeCours VARCHAR(45) not null;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table SESSION
    -> add constraint date_check check (dateFin > dateDebut);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table SPECIALITE
    -> ADD Active BOOLEAN;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>