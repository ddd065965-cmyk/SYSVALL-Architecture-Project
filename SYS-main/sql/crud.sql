CREATE TABLE IF NOT EXISTS etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    filiere VARCHAR(50) NOT NULL,
    note DECIMAL(4,2)
);

-- Reset existing data for a clean demonstration
TRUNCATE TABLE etudiants;

-- CREATE
INSERT INTO etudiants (nom, filiere, note) VALUES ('Jean Dupont', 'Informatique', 15.5);
INSERT INTO etudiants (nom, filiere, note) VALUES ('Marie Martin', 'Reseaux', 14.0);

-- READ
SELECT '--- Liste initiale des etudiants ---' AS '';
SELECT * FROM etudiants;

-- UPDATE
UPDATE etudiants SET note = 16.5 WHERE nom = 'Jean Dupont';

-- DELETE
DELETE FROM etudiants WHERE nom = 'Marie Martin';

-- READ FINAL
SELECT '--- Liste finale apres modifications ---' AS '';
SELECT * FROM etudiants;
