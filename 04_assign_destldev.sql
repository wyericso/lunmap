USE vspg;

ALTER TABLE ldevmap ADD COLUMN DestLDEV VARCHAR(8) UNIQUE;
ALTER TABLE ldevmap ADD COLUMN DummyLDEV VARCHAR(8) UNIQUE;

SET @i = CONV('3A00', 16, 10) - 1;
SET @j = CONV('3C00', 16, 10) - 1;
UPDATE ldevmap SET
    DestLDEV = REGEXP_REPLACE(LPAD(HEX(@i:=@i+1), 6, '0'), '^(\\w\\w)(\\w\\w)(\\w\\w)$', '\\1:\\2:\\3'),
    DummyLDEV = REGEXP_REPLACE(LPAD(HEX(@j:=@j+1), 6, '0'), '^(\\w\\w)(\\w\\w)(\\w\\w)$', '\\1:\\2:\\3')
ORDER BY Server, LDEV;
