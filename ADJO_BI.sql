--QUESTION 1
CREATE DATABASE ADJO_BI;

USE ADJO_BI;

CREATE TABLE PRODUIT(
id_produit INT PRIMARY KEY IDENTITY,
code_produit VARCHAR(20) UNIQUE NOT NULL,
nom_produit  VARCHAR(100) NOT NULL,
categorie  VARCHAR (100),
prix_unitaire DECIMAL ,
unite VARCHAR(20)
);

CREATE TABLE CLIENT(
id_client  INT PRIMARY KEY IDENTITY(1,1),
code_client VARCHAR(20) UNIQUE NOT NULL,
raison_social VARCHAR(100),
type_client VARCHAR (100),
ville_client VARCHAR (100),
telephone VARCHAR(20),
date_inscription DATE
);

CREATE TABLE EMPLOYE(
id_employe  INT PRIMARY KEY IDENTITY(1,1),
nom  VARCHAR(100),
prenom VARCHAR(100),
poste VARCHAR (100),
ville VARCHAR (100),
date_embauche  DATE
);

CREATE TABLE COMMANDE (
  id_commande           INT PRIMARY KEY IDENTITY(1,1),
  id_client             INT NOT NULL,
  id_employe            INT NOT NULL,
  date_commande         DATE,
  date_livraison_souhaitee DATE,
  statut                VARCHAR(50),
  CONSTRAINT FK_COMMANDE_CLIENT  FOREIGN KEY (id_client)  REFERENCES CLIENT(id_client),
  CONSTRAINT FK_COMMANDE_EMPLOYE FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_employe)
);

CREATE TABLE LIGNE_COMMANDE (
  id_ligne            INT PRIMARY KEY IDENTITY(1,1),
  id_commande         INT NOT NULL,
  id_produit          INT NOT NULL,
  quantite            DECIMAL(10,2),
  prix_unitaire_vente DECIMAL(10,2),
  CONSTRAINT FK_LC_COMMANDE FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande),
  CONSTRAINT FK_LC_PRODUIT  FOREIGN KEY (id_produit)  REFERENCES PRODUIT(id_produit)
);

CREATE TABLE PAIEMENT (
  id_paiement   INT PRIMARY KEY IDENTITY(1,1),
  id_commande   INT NOT NULL,
  date_paiement DATE,
  montant       DECIMAL(12,2),
  mode_paiement VARCHAR(50),
  CONSTRAINT FK_PAIEMENT_COMMANDE FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande)
);

CREATE TABLE STOCK (
  id_stock         INT PRIMARY KEY IDENTITY(1,1),
  id_produit       INT NOT NULL,
  quantite_stock   DECIMAL(10,2),
  date_mise_a_jour DATE,
  CONSTRAINT FK_STOCK_PRODUIT FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit)
);

--QUESTION 2

INSERT INTO PRODUIT (code_produit, nom_produit, categorie, prix_unitaire, unite) VALUES
('P001', 'Ananas',          'Fruit',   350.00,  'Kg'),
('P002', 'Mangue',          'Fruit',   500.00,  'Kg'),
('P003', 'Plantain',        'Legume',  250.00,  'Kg'),
('P004', 'Igname',          'Legume',  400.00,  'Kg'),
('P005', 'Gingembre',       'Epice',   1200.00, 'Kg'),
('P006', 'Piment',          'Epice',   800.00,  'Kg'),
('P007', 'Ananas séché',    'Transforme', 1500.00, 'Kg'),
('P008', 'Gingembre séché', 'Transforme', 2000.00, 'Kg');



INSERT INTO CLIENT (code_client, raison_sociale, type_client, ville, pays, telephone, date_inscription) VALUES
('C001', 'Marché Central SARL',     'Grossiste',    'Lomé',        'Togo',         '90112233', '2023-01-10'),
('C002', 'Ets Koffi & Frères',      'Grossiste',    'Lomé',        'Togo',         '91223344', '2023-02-15'),
('C003', 'Coopérative Agro Bénin',  'Exportateur',  'Cotonou',     'Bénin',        '97334455', '2023-03-20'),
('C004', 'Société FRUITAGE',        'Exportateur',  'Ouagadougou', 'Burkina Faso', '70445566', '2023-04-05'),
('C005', 'Détail Express',          'Détaillant',   'Lomé',        'Togo',         '92556677', '2023-05-12'),
('C006', 'Marché Assigamé',         'Détaillant',   'Lomé',        'Togo',         '93667788', '2023-06-18'),
('C007', 'Import FRUIT Côte Ivoire','Exportateur',  'Abidjan',     'Côte d''Ivoire','0022778899','2023-07-22'),
('C008', 'Ets Mensah Commerce',     'Grossiste',    'Kpalimé',     'Togo',         '94889900', '2023-08-30'),
('C009', 'Agro FRUIT Bénin',        'Exportateur',  'Porto-Novo',  'Bénin',        '96990011', '2023-09-14'),
('C010', 'Boutique Savane',         'Détaillant',   'Sokodé',      'Togo',         '95001122', '2023-10-01');



INSERT INTO EMPLOYE (nom, prenom, poste, ville, date_embauche) VALUES
('AGBEKO',   'Kossi',    'Commercial',        'Lomé',   '2022-01-15'),
('MENSAH',   'Afi',      'Commercial',        'Lomé',   '2022-03-01'),
('KOFFI',    'Yao',      'Responsable Ventes','Lomé',   '2021-06-10'),
('DOSSOU',   'Akosua',   'Commercial',        'Lomé',   '2022-07-20'),
('TCHAMDJA', 'Ibrahim',  'Commercial',        'Sokodé', '2023-01-05');



INSERT INTO COMMANDE (id_client, id_employe, date_commande, date_livraison_souhaitee, statut) VALUES
(1,  1, '2024-01-15', '2024-01-20', 'Livré'),
(2,  2, '2024-01-20', '2024-01-25', 'Livré'),
(3,  1, '2024-01-28', '2024-02-02', 'Livré'),
(4,  3, '2024-02-05', '2024-02-10', 'Livré'),
(5,  2, '2024-02-20', '2024-02-25', 'Livré'),
(6,  4, '2024-03-05', '2024-03-10', 'Livré'),
(7,  1, '2024-03-12', '2024-03-17', 'Livré'),
(8,  3, '2024-03-22', '2024-03-27', 'Livré'),
(9,  2, '2024-04-08', '2024-04-13', 'Livré'),
(10, 5, '2024-04-15', '2024-04-20', 'Livré'),
(1,  1, '2024-04-25', '2024-04-30', 'Livré'),
(2,  2, '2024-05-15', '2024-05-20', 'Livré'),
(3,  3, '2024-05-20', '2024-05-25', 'Livré'),
(4,  4, '2024-06-03', '2024-06-08', 'Livré'),
(5,  1, '2024-06-18', '2024-06-23', 'Livré'),
(6,  2, '2024-06-20', '2024-06-25', 'Livré'),
(7,  5, '2024-07-08', '2024-07-13', 'Livré'),
(8,  3, '2024-07-10', '2024-07-15', 'Livré'),
(9,  1, '2024-07-22', '2024-07-27', 'Livré'),
(10, 4, '2024-08-03', '2024-08-08', 'Livré'),
(1,  2, '2024-08-14', '2024-08-19', 'Livré'),
(2,  1, '2024-08-20', '2024-08-25', 'Annulé'),
(3,  3, '2024-09-08', '2024-09-13', 'Livré'),
(4,  5, '2024-09-15', '2024-09-20', 'Livré'),
(5,  2, '2024-09-28', '2024-10-03', 'Livré'),
(6,  4, '2024-10-05', '2024-10-10', 'Livré'),
(7,  1, '2024-10-22', '2024-10-27', 'Livré'),
(8,  3, '2024-10-23', '2024-10-28', 'Livré'),
(9,  2, '2024-11-05', '2024-11-10', 'Livré'),
(10, 5, '2024-11-12', '2024-11-17', 'Livré'),
(1,  1, '2024-11-20', '2024-11-25', 'Annulé'),
(2,  2, '2024-11-28', '2024-12-03', 'Annulé'),
(3,  3, '2024-12-10', '2024-12-15', 'Livré'),
(4,  4, '2024-12-15', '2024-12-20', 'Livré'),
(5,  1, '2024-12-25', '2024-12-30', 'Livré'),

(6,  2, '2025-01-10', '2025-01-15', 'Livré'),
(7,  5, '2025-01-15', '2025-01-20', 'Livré'),
(8,  3, '2025-01-22', '2025-01-27', 'Livré'),
(9,  1, '2025-02-08', '2025-02-13', 'Livré'),
(10, 4, '2025-02-10', '2025-02-15', 'Livré'),
(1,  2, '2025-02-20', '2025-02-25', 'Livré'),
(2,  1, '2025-03-03', '2025-03-08', 'Livré'),
(3,  3, '2025-03-15', '2025-03-20', 'Livré'),
(4,  5, '2025-03-18', '2025-03-23', 'Annulé'),
(5,  2, '2025-03-20', '2025-03-25', 'Livré'),
(6,  4, '2025-04-02', '2025-04-07', 'Livré'),
(7,  1, '2025-04-05', '2025-04-10', 'Livré'),
(8,  3, '2025-04-10', '2025-04-15', 'Livré'),
(9,  2, '2025-04-20', '2025-04-25', 'En cours'),
(10, 5, '2025-04-22', '2025-04-27', 'En cours');
GO

INSERT INTO LIGNE_COMMANDE (id_commande, id_produit, quantite, prix_unitaire_vente) VALUES
(1,  1, 500,  380.00),
(2,  2, 200,  550.00),
(3,  3, 800,  270.00),
(3,  4, 300,  420.00),
(4,  5, 150,  1300.00),
(5,  6, 100,  850.00),
(6,  1, 400,  380.00),
(6,  3, 500,  270.00),
(7,  7, 200,  1600.00),
(8,  2, 350,  550.00),
(9,  4, 400,  420.00),
(9,  5, 100,  1300.00),
(10, 6, 80,   850.00),
(11, 1, 600,  380.00),
(12, 3, 700,  270.00),
(13, 8, 150,  2100.00),
(13, 2, 250,  550.00),
(14, 5, 200,  1300.00),
(15, 1, 300,  380.00),
(15, 6, 120,  850.00),
(16, 4, 200,  420.00),
(17, 7, 180,  1600.00),
(18, 2, 400,  550.00),
(19, 8, 100,  2100.00),
(20, 3, 600,  270.00),
(21, 1, 500,  380.00),
(23, 4, 350,  420.00),
(23, 6, 150,  850.00),
(24, 5, 180,  1300.00),
(25, 2, 300,  550.00),
(26, 1, 450,  380.00),
(27, 7, 220,  1600.00),
(28, 3, 800,  270.00),
(29, 8, 120,  2100.00),
(30, 4, 400,  420.00),
(33, 2, 500,  550.00),
(34, 5, 250,  1300.00),
(35, 1, 600,  380.00),
(36, 6, 200,  850.00),
(37, 7, 150,  1600.00),
(38, 3, 900,  270.00),
(39, 4, 300,  420.00),
(40, 2, 250,  550.00),
(41, 1, 500,  380.00),
(41, 5, 100,  1300.00),
(42, 8, 80,   2100.00),
(43, 6, 180,  850.00),
(45, 3, 700,  270.00),
(46, 2, 400,  550.00),
(47, 1, 300,  380.00),
(48, 4, 250,  420.00);


INSERT INTO PAIEMENT (id_commande, date_paiement, montant, mode_paiement) VALUES
(1,  '2024-01-18', 250000,  'Virement'),
(1,  '2024-01-25', 100000,  'Espèces'),
(2,  '2024-01-20', 75000,   'Espèces'),
(3,  '2024-01-30', 500000,  'Virement'),
(3,  '2024-02-05', 250000,  'Virement'),
(4,  '2024-02-12', 180000,  'Virement'),
(5,  '2024-02-25', 1250000, 'Virement'),
(6,  '2024-03-08', 80000,   'Espèces'),
(7,  '2024-03-15', 65000,   'Espèces'),
(8,  '2024-03-25', 400000,  'Virement'),
(9,  '2024-04-10', 950000,  'Virement'),
(10, '2024-04-18', 85000,   'Espèces'),
(11, '2024-04-28', 350000,  'Virement'),
(12, '2024-05-18', 550000,  'Virement'),
(13, '2024-05-22', 1100000, 'Virement'),
(14, '2024-06-05', 90000,   'Espèces'),
(15, '2024-06-20', 350000,  'Virement'),
(16, '2024-06-23', 65000,   'Espèces'),
(17, '2024-07-10', 450000,  'Virement'),
(18, '2024-07-13', 85000,   'Espèces'),
(19, '2024-07-25', 1000000, 'Virement'),
(20, '2024-08-05', 400000,  'Virement'),
(21, '2024-08-16', 75000,   'Espèces'),
(22, NULL,         0,       NULL),
(23, '2024-09-10', 1150000, 'Virement'),
(24, '2024-09-18', 95000,   'Espèces'),
(25, '2024-10-01', 320000,  'Virement'),
(26, '2024-10-08', 70000,   'Espèces'),
(27, '2024-10-25', 65000,   'Espèces'),
(28, '2024-10-26', 480000,  'Virement'),
(29, '2024-11-08', 380000,  'Virement'),
(30, '2024-11-16', 900000,  'Virement'),
(31, NULL,         0,       NULL),
(32, NULL,         0,       NULL),
(33, '2024-12-15', 1150000, 'Virement'),
(34, '2024-12-18', 95000,   'Espèces'),
(35, '2024-12-28', 320000,  'Virement'),
(36, '2025-01-12', 400000,  'Virement'),
(37, '2025-01-18', 85000,   'Espèces'),
(38, '2025-01-25', 950000,  'Virement'),
(39, '2025-02-10', 550000,  'Virement'),
(40, '2025-02-13', 70000,   'Espèces'),
(41, '2025-02-22', 420000,  'Virement'),
(42, '2025-03-05', 85000,   'Espèces'),
(43, '2025-03-18', 800000,  'Virement'),
(44, NULL,         0,       NULL),
(45, '2025-03-23', 75000,   'Espèces'),
(46, '2025-04-05', 400000,  'Virement'),
(47, '2025-04-08', 80000,   'Espèces'),
(48, '2025-04-12', 480000,  'Virement'),
(49, NULL,         0,       NULL),
(50, NULL,         0,       NULL);



INSERT INTO STOCK (id_produit, quantite_stock, date_mise_a_jour) VALUES
(1, 2500, '2025-04-01'),
(2, 1800, '2025-04-01'),
(3, 3200, '2025-04-01'),
(4, 1500, '2025-04-01'),
(5, 800,  '2025-04-01'),
(6, 400,  '2025-04-01'),
(7, 600,  '2025-04-01'),
(8, 750,  '2025-04-01');

--QUESTION 3
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  AND TABLE_CATALOG = 'ADJO_BI';

 --QUESTION 4
SELECT 
  fk.TABLE_NAME,
  fk.COLUMN_NAME,
  pk.TABLE_NAME  AS table_referencee,
  pk.COLUMN_NAME AS colonne_referencee
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE fk
  ON rc.CONSTRAINT_NAME = fk.CONSTRAINT_NAME
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE pk
  ON rc.UNIQUE_CONSTRAINT_NAME = pk.CONSTRAINT_NAME;
  --QUESTION 5
SELECT*
FROM CLIENT;

--QUESTION 6
SELECT *
FROM PRODUIT;

--QUESTION 7
SELECT*
FROM CLIENT
WHERE type_client='Grossiste';

--QUESTION 8
SELECT *
FROM PRODUIT
WHERE prix_unitaire>500;

--QUESTION 9
SELECT*
FROM CLIENT 
WHERE ville <> 'Lomé';

--QUESTION 10
SELECT *
FROM COMMANDE
WHERE date_commande BETWEEN '2025-01-01'AND '2025-03-31';

--QUESTION 11
SELECT *
FROM CLIENT
WHERE raison_sociale LIKE '%FRUIT%';

--QUESTION 12
SELECT id_commande, date_commande, statut, nom, prenom, raison_sociale
FROM COMMANDE 
JOIN CLIENT ON CLIENT.id_client=COMMANDE.id_client 
JOIN EMPLOYE ON EMPLOYE.id_employe=COMMANDE.id_employe;

--QUESTION 13
SELECT nom_produit,categorie,prix_unitaire, id_produit
FROM PRODUIT 
LEFT JOIN LIGNE_COMMANDE ON PRODUIT.id_produit = LIGNE_COMMANDE.id_produit; 

--QUESTION 14
SELECT raison_sociale, SUM(prix_unitaire_vente * quantite)
FROM CLIENT
JOIN COMMANDE ON CLIENT.id_client=COMMANDE.id_client
JOIN LIGNE_COMMANDE ON COMMANDE.id_commande= LIGNE_COMMANDE.id_commande
GROUP BY CLIENT.id_client , raison_sociale
ORDER BY SUM(prix_unitaire_vente * quantite) DESC;

--QUESTION 15
SELECT FORMAT(date_commande,'yyyy-MM') AS mois,
COUNT(*)
FROM COMMANDE 
GROUP BY FORMAT(date_commande,'yyyy-MM')
ORDER BY mois;

--QUESTION 16
SELECT raison_sociale, SUM(prix_unitaire_vente * quantite)
FROM CLIENT
JOIN COMMANDE ON CLIENT.id_client=COMMANDE.id_client
JOIN LIGNE_COMMANDE ON COMMANDE.id_commande= LIGNE_COMMANDE.id_commande
GROUP BY CLIENT.id_client , raison_sociale
HAVING SUM(prix_unitaire_vente * quantite) > 5000000;

--QUESTION 17
SELECT 
  raison_sociale,
  SUM(quantite * prix_unitaire_vente) 
FROM CLIENT 
JOIN COMMANDE  ON CLIENT.id_client  = COMMANDE.id_client
JOIN LIGNE_COMMANDE  ON COMMANDE.id_commande = LIGNE_COMMANDE.id_commande
GROUP BY CLIENT.id_client, raison_sociale
HAVING SUM(quantite * prix_unitaire_vente) > (
  SELECT AVG(total) FROM (
    SELECT SUM(quantite * prix_unitaire_vente) AS total
    FROM COMMANDE 
    JOIN LIGNE_COMMANDE  ON COMMANDE.id_commande = LIGNE_COMMANDE.id_commande
    GROUP BY COMMANDE.id_client
  ) AS sous_requete 
  );

  --QUESTION 18
SELECT  TOP 10 raison_sociale, SUM(prix_unitaire_vente * quantite)
FROM CLIENT
JOIN COMMANDE ON CLIENT.id_client=COMMANDE.id_client
JOIN LIGNE_COMMANDE ON COMMANDE.id_commande= LIGNE_COMMANDE.id_commande
GROUP BY CLIENT.id_client , raison_sociale
ORDER BY SUM(prix_unitaire_vente * quantite) DESC;

--QUESTION 19
SELECT ville, SUM(prix_unitaire_vente * quantite)
FROM CLIENT
JOIN COMMANDE ON CLIENT.id_client=COMMANDE.id_client
JOIN LIGNE_COMMANDE ON COMMANDE.id_commande= LIGNE_COMMANDE.id_commande
GROUP BY CLIENT.id_client , ville
ORDER BY SUM(prix_unitaire_vente * quantite) DESC;

--QUESTION 20
SELECT TOP 1 nom_produit ,SUM(quantite)
FROM PRODUIT
JOIN LIGNE_COMMANDE ON PRODUIT.id_produit= LIGNE_COMMANDE.id_produit
GROUP BY PRODUIT.id_produit, nom_produit
ORDER BY SUM(quantite) DESC;





