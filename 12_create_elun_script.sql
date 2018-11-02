# Generate script for running on VSP

USE vspg;

# raidcom add lun -port CL1-G-250 -ldev_id 00:07:38 -lun_id 131

SET @i = 131 - 1;

SELECT CONCAT('raidcom add lun -port CL1-G-250 -ldev_id ', LDEV, ' -lun_id ', (@i:=@i+1))
FROM ldevmap
ORDER BY Server, LDEV;

SET @i = 131 - 1;

SELECT CONCAT('raidcom add lun -port CL2-G-250 -ldev_id ', LDEV, ' -lun_id ', (@i:=@i+1))
FROM ldevmap
ORDER BY Server, LDEV;
