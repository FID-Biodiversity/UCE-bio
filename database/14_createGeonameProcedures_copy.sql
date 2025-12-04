
-- Create a cached materialized view of logical links and geoname/time annotations
-- To refresh it, use "REFRESH MATERIALIZED VIEW [NAME]]"
CREATE MATERIALIZED VIEW IF NOT EXISTS geoname_context_timeline_cache AS
SELECT
    g.id AS geoname_id,
    g.name AS geoname_name,
    g.location_geom,
    al.corpusid,
    t.date,
	al.fromannotationtypetable,
    COUNT(*) AS context_count
FROM annotationlink al
JOIN geoname g ON g.id = al.toid AND al.toannotationtypetable = 'geoname'
INNER JOIN (
    SELECT al1.fromid, t.date
    FROM annotationlink al1
    JOIN time t ON al1.toid = t.id and al1.toannotationtypetable = 'time'
    WHERE al1.linkid = 'context' AND t.date IS NOT NULL
) t ON al.fromid = t.fromid
WHERE al.linkid = 'context' -- and al.fromannotationtypetable != 'namedEntity' 
GROUP BY
    g.id, g.name, g.location_geom, al.corpusid, t.date, al.fromannotationtypetable;
	