--Replacing frommcovered column in annotationlink

CREATE OR REPLACE FUNCTION get_namedentity_text_by_link_fromm(
    annotationlink_id BIGINT
)
RETURNS TEXT
AS $$
DECLARE
    coveredtext_result TEXT;
BEGIN
    SELECT COALESCE(ne.coveredtext, gnf.coveredtext, gaz.coveredtext)
    INTO coveredtext_result
    FROM annotationlink al
    JOIN document d
        ON d.documentid = al.fromm
    LEFT JOIN namedentity ne
        ON ne.document_id = d.document_id
       AND ne.beginn = al.frombegin
       AND ne.endd = al.fromend
    LEFT JOIN gnfindertaxon gnf
        ON gnf.document_id = d.document_id
       AND gnf.beginn = al.frombegin
       AND gnf.endd = al.fromend
    LEFT JOIN gazetteertaxon gaz
        ON gaz.document_id = d.document_id
       AND gaz.beginn = al.frombegin
       AND gaz.endd = al.fromend
    WHERE al.id = annotationlink_id
    LIMIT 1;

    RETURN coveredtext_result;
END;
$$ LANGUAGE plpgsql STABLE;

--Replacing tocovered column in annotationlink
CREATE OR REPLACE FUNCTION get_namedentity_text_by_link_too(
    annotationlink_id BIGINT
)
RETURNS TEXT
AS $$
DECLARE
    coveredtext_result TEXT;
BEGIN
    SELECT COALESCE(ne.coveredtext, te.coveredtext)
    INTO coveredtext_result
    FROM annotationlink al
    JOIN document d
        ON d.documentid = al.too
    LEFT JOIN namedentity ne
        ON ne.document_id = d.document_id
       AND ne.beginn = al.tobegin
       AND ne.endd = al.toend
    LEFT JOIN time te
        ON te.document_id = d.document_id
       AND te.beginn = al.tobegin
       AND te.endd = al.toend
    WHERE al.id = annotationlink_id
    LIMIT 1;

    RETURN coveredtext_result;
END;
$$ LANGUAGE plpgsql STABLE;
