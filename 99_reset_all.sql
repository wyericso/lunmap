DROP DATABASE vspg;

SOURCE 01_create_db_tables.sql;
SOURCE 02_load_wlb_server.sql;
SOURCE 02_load_wlb_hostgrp_wwn.sql;
SOURCE 03_load_wwninfo.sql;
SOURCE 03_load_luninfo.sql;
SOURCE 03_load_ldevinfo.sql;
SOURCE 11_join_lunmap.sql;
SOURCE 12_create_virtualization.sql;
