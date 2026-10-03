-- Deblocar Customer & Growth Analytics
-- SQL Business Analysis Queries

USE deblocar_analytics;


-- 1. Total number of leads
SELECT
    COUNT(*) AS total_leads
FROM leads;


-- 2. Monthly lead volume
SELECT
    lead_month,
    COUNT(*) AS total_leads
FROM leads
GROUP BY lead_month
ORDER BY
    CASE lead_month
        WHEN 'Juin' THEN 1
        WHEN 'Juillet' THEN 2
        WHEN 'Août' THEN 3
        WHEN 'Septembre' THEN 4
        ELSE 5
    END;


-- 3. Lead distribution by acquisition source
SELECT
    COALESCE(NULLIF(TRIM(source_du_lead), ''), 'Missing') AS lead_source,
    COUNT(*) AS total_leads,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM leads),
        1
    ) AS percentage
FROM leads
GROUP BY COALESCE(NULLIF(TRIM(source_du_lead), ''), 'Missing')
ORDER BY total_leads DESC;


-- 4. Current lead status distribution
SELECT
    status_group,
    COUNT(*) AS total_leads,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM leads),
        1
    ) AS percentage
FROM leads
GROUP BY status_group
ORDER BY total_leads DESC;


-- 5. Top requested services
SELECT
    COALESCE(NULLIF(TRIM(service_standardized), ''), 'Missing') AS service,
    COUNT(*) AS total_requests
FROM leads
GROUP BY COALESCE(NULLIF(TRIM(service_standardized), ''), 'Missing')
ORDER BY total_requests DESC
LIMIT 10;


-- 6. Completed services by acquisition source
SELECT
    COALESCE(NULLIF(TRIM(source_du_lead), ''), 'Missing') AS lead_source,
    COUNT(*) AS completed_services
FROM leads
WHERE status_group = 'Service completed'
GROUP BY COALESCE(NULLIF(TRIM(source_du_lead), ''), 'Missing')
ORDER BY completed_services DESC;


-- 7. Completed services by requested service
SELECT
    COALESCE(NULLIF(TRIM(service_standardized), ''), 'Missing') AS service,
    COUNT(*) AS completed_services
FROM leads
WHERE status_group = 'Service completed'
GROUP BY COALESCE(NULLIF(TRIM(service_standardized), ''), 'Missing')
ORDER BY completed_services DESC
LIMIT 10;


-- 8. Data quality summary
SELECT
    COUNT(*) AS total_leads,
    SUM(source_du_lead IS NULL OR TRIM(source_du_lead) = '') AS missing_sources,
    SUM(service_demande IS NULL OR TRIM(service_demande) = '') AS missing_services,
    SUM(status_group IS NULL OR TRIM(status_group) = '') AS missing_status_groups
FROM leads;