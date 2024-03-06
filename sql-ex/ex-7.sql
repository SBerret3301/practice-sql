
mysql> SELECT * FROM race;
+--------------+----------+------------+
| nomRace      | poidType | tailleType |
+--------------+----------+------------+
| Akhal-Téké   |   330.00 |     165.00 |
| Appaloosa    |   320.00 |     155.00 |
| arabian      |   300.00 |     150.00 |
| Frison       |   350.00 |     160.00 |
| Haflinger    |   310.00 |     158.00 |
+--------------+----------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM person;
+------------+---------+---------+-----------+------------------+---------------+---------------+
| num_person | nom     | prenom  | telephon  | adresse          | fonction      | num_personSup |
+------------+---------+---------+-----------+------------------+---------------+---------------+
|          1 | Doe     | John    | 123456789 | 123 Main Street  | Directeur     |          NULL |
|          2 | Smith   | Alice   | 987654321 | 456 Elm Street   | Secrétaire    |             1 |
|          3 | Johnson | Robert  | 654987321 | 789 Oak Avenue   | Éleveur       |             1 |
|          4 | Brown   | Emily   | 321456987 | 101 Pine Street  | Comptable     |             1 |
|          5 | Wilson  | Michael | 789123456 | 222 Maple Avenue | Propriétaire  |          NULL |
+------------+---------+---------+-----------+------------------+---------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM cheval;
+------------+------------+--------------+----------------+----------------+----------------+----------------+--------------+
| num_cheval | nom_cheval | num_tatouage | couleur_cheval | num_chevalPere | num_chevalMere | num_persElveur | nomRace      |
+------------+------------+--------------+----------------+----------------+----------------+----------------+--------------+
|          1 | Aramis     | ABC123       | Noir           |           NULL |           NULL |              3 | arabian      |
|          2 | Bella      | DEF456       | Blanc          |           NULL |           NULL |              3 | Frison       |
|          3 | Casanova   | GHI789       | Marron         |              1 |              2 |              4 | Appaloosa    |
|          4 | Diamant    | JKL012       | Gris           |              1 |              2 |              4 | Haflinger    |
|          5 | Éclair     | MNO345       | Alezan         |              1 |              2 |              5 | Akhal-Téké   |
+------------+------------+--------------+----------------+----------------+----------------+----------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM croissance;
+---------------+------+------------+-----------+------------+
| ID_CROISSANCE | mois | tailleMois | poidsMois | num_cheval |
+---------------+------+------------+-----------+------------+
|             1 |    1 | 150        | 300       |          1 |
|             2 |    2 | 155        | 320       |          1 |
|             3 |    1 | 160        | 350       |          2 |
|             4 |    2 | 165        | 330       |          2 |
|             5 |    1 | 158        | 310       |          3 |
+---------------+------+------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM proprietaire;
+------------+------------+------------+------------+
| num_person | num_cheval | dateAchat  | prix_Achat |
+------------+------------+------------+------------+
|          5 |          1 | 2023-01-01 |       5000 |
|          5 |          2 | 2023-02-01 |       6000 |
|          5 |          3 | 2023-03-01 |       7000 |
|          5 |          4 | 2023-04-01 |       8000 |
|          5 |          5 | 2023-05-01 |       9000 |
+------------+------------+------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM concour;
+------------------------------------+--------------+----------------+
| nomConcour                         | anneeConcour | nbrParticipant |
+------------------------------------+--------------+----------------+
| Championnat Équestre d'Agadir      |         2023 |             80 |
| Concours Hippique de Rabat         |         2023 |             70 |
| Grand Prix de Casablanca           |         2023 |             60 |
| Jumping International de Marrakech |         2023 |             50 |
| Tournoi de Dressage de Fès         |         2023 |             90 |
+------------------------------------+--------------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM participer;
+------------+------------------------------------+--------------+--------------+
| num_cheval | nom_concour                        | anneeConcour | placeConcour |
+------------+------------------------------------+--------------+--------------+
|          1 | Jumping International de Marrakech |         2023 | Première     |
|          2 | Grand Prix de Casablanca           |         2023 | Deuxième     |
|          3 | Concours Hippique de Rabat         |         2023 | Troisième    |
|          4 | Championnat Équestre d'Agadir      |         2023 | Quatrième    |
|          5 | Tournoi de Dressage de Fès         |         2023 | Cinquième    |
+------------+------------------------------------+--------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM cheval WHERE nomRace = 'Arabian' ORDER BY nom_cheval DESC;
+------------+------------+--------------+----------------+----------------+----------------+----------------+---------+
| num_cheval | nom_cheval | num_tatouage | couleur_cheval | num_chevalPere | num_chevalMere | num_persElveur | nomRace |
+------------+------------+--------------+----------------+----------------+----------------+----------------+---------+
|          1 | Aramis     | ABC123       | Noir           |           NULL |           NULL |              3 | arabian |
+------------+------------+--------------+----------------+----------------+----------------+----------------+---------+
1 row in set (0.00 sec)

mysql> select poidType, tailleType
    -> from race
    -> where nomrace = 'arabian';
+----------+------------+
| poidType | tailleType |
+----------+------------+
|   300.00 |     150.00 |
+----------+------------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT nom, prenom
    -> FROM person
    -> JOIN proprietaire ON person.num_person = proprietaire.num_person;
+--------+---------+
| nom    | prenom  |
+--------+---------+
| Wilson | Michael |
+--------+---------+
1 row in set (0.01 sec)

mysql> SELECT nom, prenom
    -> FROM person
    -> WHERE num_personSup IS NULL;
+--------+---------+
| nom    | prenom  |
+--------+---------+
| Doe    | John    |
| Wilson | Michael |
+--------+---------+
2 rows in set (0.00 sec)

mysql> SELECT nomConcour
    -> FROM concour
    -> WHERE anneeConcour = 2019;
Empty set (0.00 sec)

mysql>