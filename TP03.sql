-- apprenant: tom_lagoutte
-- equipe: A
-- seed-w12: 2026-04-13

CREATE DATABASE IF NOT EXISTS sav_w12_tp03_tom
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE sav_w12_tp03_tom;

CREATE TABLE categorie (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  libelle VARCHAR(80) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_categorie_libelle UNIQUE (libelle)
);

CREATE TABLE ticket (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titre VARCHAR(160) NOT NULL,
  ouvert_le DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ticket_categorie (
  ticket_id INT UNSIGNED NOT NULL,
  categorie_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (ticket_id, categorie_id),
  CONSTRAINT fk_tc_ticket FOREIGN KEY (ticket_id) REFERENCES ticket (id),
  CONSTRAINT fk_tc_categorie FOREIGN KEY (categorie_id) REFERENCES categorie (id)
);
INSERT INTO categorie (libelle) VALUES
  ('Materiel'),
  ('Reseau'),
  ('Logiciel');

INSERT INTO ticket (titre, ouvert_le) VALUES
  ('Switch bruyant', '2026-04-10'),
  ('Bug export CSV', '2026-04-11');

INSERT INTO ticket_categorie (ticket_id, categorie_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3);

SELECT t.id, t.titre, c.libelle
FROM ticket t
JOIN ticket_categorie tc ON tc.ticket_id = t.id
JOIN categorie c ON c.id = tc.categorie_id
ORDER BY t.id, c.id;