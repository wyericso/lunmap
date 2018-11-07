USE vspg;
LOAD DATA LOCAL INFILE '/media/psf/Home/Downloads/Ldevinfo.csv'
INTO TABLE ldevinfo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 2 LINES;
