# LUN Map Tool for Quick LUN Mapping #

## Data Covered for Commands ##

### Preparation for data migration via UVM ###
1. Target storage: raidcom add ldev -ldev_id 00:3C:00 -capacity 251658240 -pool 0
2. Target storage: raidcom modify ldev -ldev_id 00:3C:00 -ldev_name AML_App_1_DM_DUMMY
3. Target storage: raidcom add lun -port CL1-E-254 -ldev_id 00:3C:00
4. Source storage: raidcom add lun -port CL1-G-250 -ldev_id 00:07:38 -lun_id 131
5. Target storage: raidcom add host_grp -port CL1-C -host_grp_name FATCA_BPM_DR1
6. Target storage: raidcom modify host_grp -port CL1-C FATCA_BPM_DR1 -host_mode AIX
7. Target storage: virtualize E-LUNs
8. Target storage, for those successfully virtualized only: raidcom add lun -port CL5-G AML_APP1_DR2 -ldev_id 00:3A:00 -lun_id 0
9. Fabric A: zonecreate EH_G1500_6G_AML_APP1_DR1, "EH_G1500_6G;AML_APP1_DR1"
10. Fabric B: zonecreate EH_G1500_5G_AML_APP1_DR2, "EH_G1500_5G;AML_APP1_DR2"

### Migration ###

## Requirements of This Tool ##
- Tested on:
    - Ubuntu Desktop 16.04.5
    - MariaDB 10.0.36

## Instructions for WLB ##
Please refer to `wlb_datastructure.txt` for table relationship.

### Collect data ###
1. Source `01_create_db_tables.sql` to create databases and tables.
2. Generate `wlb_server.csv` and `wlb_hostgrp_wwn.csv`.
    - If Excel is used, save the file as Comma Separated Values (.csv). **DO NOT** save the .csv file as UTF-8 format.
    - Put `N` in blank last field `PowerHAorHACMP` of each row.
    - Eliminate all colons (`:`) from the WWNs.
3. Source `02_load_wlb_server.sql` and `02_load_wlb_hostgrp_wwn.sql` to load WLB server data.
4. Collect `Wwninfo.csv`, `Luninfo.csv` and `Ldevinfo.csv` from source storage configuration report.
5. Source `03_load_wwninfo.sql`, `03_load_luninfo.sql` and `03_load_ldevinfo.sql` to load storage data.

### Map data and assign values ###
1. Run `11_join_lunmap.sql` and `12_create_virtualization.sql` to join tables and create virtualization table.
