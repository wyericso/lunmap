USE vspg;

INSERT INTO virtualization
    (LDEV)
SELECT DISTINCT
    LDEV
FROM lunmap
WHERE Batch = '3'
ORDER BY Server, LDEV;

SET @elunid = 131 - 1;
SET @dest = CONV('3A00', 16, 10) - 1;
SET @dummy = CONV('3C00', 16, 10) - 1;

UPDATE virtualization SET
    ELUNID = @elunid:=@elunid+1,
    DestLDEV = REGEXP_REPLACE(LPAD(HEX(@dest:=@dest+1), 6, '0'), '^(\\w\\w)(\\w\\w)(\\w\\w)$', '\\1:\\2:\\3'),
    DummyLDEV = REGEXP_REPLACE(LPAD(HEX(@dummy:=@dummy+1), 6, '0'), '^(\\w\\w)(\\w\\w)(\\w\\w)$', '\\1:\\2:\\3');

UPDATE virtualization SET
    DummyLDEVName = (
        SELECT CONCAT(REPLACE(Server, ' ', '_'), '_DM_DUMMY')
        FROM lunmap
        WHERE virtualization.LDEV = lunmap.LDEV
        LIMIT 1         # DummyLDEVName will be based on 1 server only if more than 1 server sharing the same LDEV.
    );
