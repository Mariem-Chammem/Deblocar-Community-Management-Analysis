-- Deblocar Customer & Growth Analytics
-- Database schema

CREATE DATABASE IF NOT EXISTS deblocar_analytics
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE deblocar_analytics;

CREATE TABLE IF NOT EXISTS leads (
    lead_id VARCHAR(20) PRIMARY KEY,
    source_du_lead VARCHAR(100),
    gouvernorat VARCHAR(100),
    modele_vehicule VARCHAR(150),
    service_demande VARCHAR(255),
    modele_de_poste VARCHAR(150),
    date_rdv VARCHAR(50),
    statut VARCHAR(100),
    confirm_j1 VARCHAR(50),
    lead_month VARCHAR(30),
    source_sheet VARCHAR(50),
    status_group VARCHAR(100),
    service_standardized VARCHAR(255)
);
SELECT COUNT(*) AS total_leads
FROM deblocar_analytics.leads;
USE deblocar_analytics;

SELECT COUNT(*) AS total_leads
FROM leads;
SHOW COLUMNS FROM leads;
USE deblocar_analytics;

SELECT COUNT(*) AS total_leads
FROM leads;
USE deblocar_analytics;

ALTER TABLE leads
CHANGE COLUMN `véhicules_modèles` modele_vehicule VARCHAR(150);
SHOW COLUMNS FROM leads;

USE deblocar_analytics;

LOAD DATA LOCAL INFILE 'C:/Users/chamm/Downloads/deblocar-customer-growth-analytics/data/processed/leads_sql_ready.csv'
INTO TABLE leads
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    lead_id,
    source_du_lead,
    gouvernorat,
    modele_vehicule,
    service_demande,
    modele_de_poste,
    date_rdv,
    statut,
    confirm_j1,
    lead_month,
    source_sheet,
    status_group,
    service_standardized
);

SELECT COUNT(*) AS total_leads
FROM leads;


SHOW WARNINGS;
SET GLOBAL local_infile = 1;
SELECT @@local_infile AS local_infile;