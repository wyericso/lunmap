USE vspg;
LOAD DATA LOCAL INFILE '/media/psf/Home/Downloads/Luninfo.csv'
INTO TABLE luninfo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES;
