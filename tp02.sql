-- TODO Étape 1 : ajoute les trois lignes de personnalisation + CREATE DATABASE + USE
-- apprenant: TOM_LAGOUTTE
-- equipe: A|B|C|solo
-- seed-w12: 2026-04-13

CREATE DATABASE IF NOT EXISTS sav_w12_tp01_tom
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE sav_w12_tp01_tom;
-- TODO Étape 2 : CREATE TABLE ticket (…)
CREATE TABLE ticket (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titre VARCHAR(160) NOT NULL,
    description TEXT NULL,
    ouvert_le DATE NOT NULL,
    est_urgent BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    CONSTRAINT fk_ticket_technicien
    FOREIGN KEY (technicien_id) REFERENCES techniciens (id)
);
-- TODO Étape 3 : INSERT INTO ticket (…) VALUES (…)
INSERT INTO ticket (titre, description, ouvert_le, est_urgent, technicien_id) VALUES
  ('Imprimante ne démarre pas', 'LED orange clignotante', '2026-04-10', TRUE),
  ('Lenteur réseau open space', NULL, '2026-04-11', FALSE),
  ('Réinstallation poste dev', 'Demande pour Windows 11', '2026-04-12', FALSE);
CREATE TABLE techniciens (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  nom VARCHAR(120) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_techniciens_email UNIQUE (email)
);
INSERT INTO techniciens (email, nom) VALUES
  ('lea.martin@example.com', 'Martin'),
  ('samir.ali@example.com', 'Ali');