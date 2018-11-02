# LUN Map Tool for Quick LUN Mapping #

## Requirements ##
- Tested on:
    - Ubuntu Desktop 16.04.5
    - MariaDB 10.0.36

## Instructions for WLB ##
1. Run `01_create_db_tables.sql` to create databases and tables.
2. Generate `wlb.csv`.
    - If Excel is used, save the file as Comma Separated Values (.csv). **DO NOT** save the .csv file as UTF-8 format.
    - Eliminate all colons (`:`) from the WWNs.
    - Put `N` in blank last field `PowerHAorHACMP` of each row.
3. Run `02_load_wlb.sql`.
4. Collect `Wwninfo.csv` `Luninfo.csv` and `Ldevinfo.csv` from storage configuration report.
5. Run `02_load_wwninfo.sql`, `02_load_luninfo.sql` and `02_load_ldevinfo.sql`.
6. Run `03_lunmap.sql` and `03_ldevmap.sql` to join tables and save into new tables.
7. Modify and run `04_assign_destldev.sql` to assign `DestLDEV` and `DummyLDEV` of `LDEV`s.