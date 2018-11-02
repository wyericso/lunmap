USE vspg;
LOAD DATA LOCAL INFILE '/media/psf/Home/Downloads/wlb.csv'
INTO TABLE wlb
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

UPDATE wlb
SET HostgroupNum = LOWER(HostgroupNum);
