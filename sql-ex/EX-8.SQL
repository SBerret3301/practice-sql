mysql> USE CENTREFORMATION;
Database changed
mysql> SELECT COUNT(*) AS nombre_etudiants FROM etudient;
+------------------+
| nombre_etudiants |
+------------------+
|                7 |
+------------------+
1 row in set (0.01 sec)

mysql> SELECT nomEtu, TIMESTAMPDIFF(YEAR, dateNaissance, CURDATE()) AS age FROM etudient;
+---------------+------+
| nomEtu        | age  |
+---------------+------+
| Alami         |   38 |
| Souni         |   25 |
| Idrissi Alami |   27 |
| Boudiaf       |   27 |
| Toumi         |   23 |
| Ben Omar      |   33 |
| Ouled thami   |   44 |
+---------------+------+
7 rows in set (0.00 sec)

mysql> SELECT titreForm AS formation_plus_chere, prixForm
    -> FROM formation
    -> WHERE prixForm = (SELECT MAX(prixForm) FROM formation);
+-------------------------+----------+
| formation_plus_chere    | prixForm |
+-------------------------+----------+
| Base de données Oracle  |     6000 |
+-------------------------+----------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT titreForm AS formation_moins_chere, prixForm
    -> FROM formation
    -> WHERE prixForm = (SELECT MIN(prixForm) FROM formation);
+-----------------------+----------+
| formation_moins_chere | prixForm |
+-----------------------+----------+
| Communication         |     2500 |
+-----------------------+----------+
1 row in set (0.00 sec)

mysql> SELECT SUM(prixForm) AS cout_total
    -> FROM formation;
+------------+
| cout_total |
+------------+
|      23050 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT s.codeSess, s.nomSess, COUNT(*) AS nombre_etudiants_inscrits
    -> FROM session s
    -> INNER JOIN inscription i ON s.codeSess = i.codeSess
    -> GROUP BY s.codeSess, s.nomSess;
+----------+-------------+---------------------------+
| codeSess | nomSess     | nombre_etudiants_inscrits |
+----------+-------------+---------------------------+
|     1101 | Session1101 |                         7 |
|     1201 | Session1201 |                         6 |
|     1302 | Session1302 |                         5 |
|     1401 | Session1401 |                         6 |
|     1501 | Session1501 |                         7 |
+----------+-------------+---------------------------+
5 rows in set (0.00 sec)

mysql> SELECT DISTINCT num_CINEtu
    -> FROM inscription;
+------------+
| num_CINEtu |
+------------+
| AB234567   |
| C0987265   |
| D2356903   |
| F9827363   |
| G5346789   |
| J3578902   |
| Y1234987   |
+------------+
7 rows in set (0.00 sec)

mysql> SELECT num_CINEtu, COUNT(*) AS nombre_inscriptions
    -> FROM inscription
    -> GROUP BY num_CINEtu;
+------------+---------------------+
| num_CINEtu | nombre_inscriptions |
+------------+---------------------+
| AB234567   |                   4 |
| C0987265   |                   5 |
| D2356903   |                   5 |
| F9827363   |                   3 |
| G5346789   |                   5 |
| J3578902   |                   4 |
| Y1234987   |                   5 |
+------------+---------------------+
7 rows in set (0.00 sec)

mysql> SELECT
    ->     session.codeSess,
    ->     session.nomSess,
    ->     COUNT(CASE WHEN inscription.TypeCours = 'D' THEN 1 ELSE NULL END) AS nombre_inscriptions_distantielles,
    ->     COUNT(CASE WHEN inscription.TypeCours = 'P' THEN 1 ELSE NULL END) AS nombre_inscriptions_presentielles
    -> FROM
    ->     session
    -> LEFT JOIN
    ->     inscription ON session.codeSess = inscription.codeSess
    -> GROUP BY
    ->     session.codeSess,
    ->     session.nomSess;
+----------+-------------+-----------------------------------+-----------------------------------+
| codeSess | nomSess     | nombre_inscriptions_distantielles | nombre_inscriptions_presentielles |
+----------+-------------+-----------------------------------+-----------------------------------+
|     1101 | Session1101 |                                 7 |                                 0 |
|     1102 | Session1102 |                                 0 |                                 0 |
|     1104 | Session1104 |                                 0 |                                 0 |
|     1201 | Session1201 |                                 0 |                                 6 |
|     1202 | Session1202 |                                 0 |                                 0 |
|     1203 | Session1203 |                                 0 |
                               0 |
|     1204 | Session1204 |                                 0 |                                 0 |
|     1301 | Session1301 |                                 0 |                                 0 |
|     1302 | Session1302 |                                 0 |                                 5 |
|     1303 | Session1303 |                                 0 |                                 0 |
|     1401 | Session1401 |                                 6 |                                 0 |
|     1402 | Session1402 |                                 0 |                                 0 |
|     1501 | Session1501 |                                 7 |                                 0 |
|     1502 | Session1502 |                                 0 |                                 0 |
|     1601 | Session1601 |                                 0 |                                 0 |
|     1602 | Session1602 |                                 0 |                                 0 |
+----------+-------------+-----------------------------------+-----------------------------------+
16 rows in set (0.00 sec)

