# Generate scripts for running on G1500

USE vspg;

# raidcom add ldev -ldev_id 00:2B:56 -capacity 251658240 -pool 0

SELECT CONCAT('raidcom add ldev -ldev_id ', DummyLDEV, ' -capacity ', VolumeSizeBlocks, ' -pool 0')
FROM ldevmap
ORDER BY DummyLDEV;

# raidcom modify ldev -ldev_id 00:3C:00 -ldev_name AML_App_1_DM_DUMMY

SELECT CONCAT('raidcom modify ldev -ldev_id ', DummyLDEV, ' -ldev_name ', REPLACE(Server, ' ', '_'), '_DM_DUMMY')
FROM ldevmap
ORDER BY DummyLDEV;

# raidcom add lun -port CL1-E-254 -ldev_id 00:3C:00

SELECT CONCAT('raidcom add lun -port CL1-E-254 -ldev_id ', DummyLDEV)
FROM ldevmap
ORDER BY DummyLDEV
