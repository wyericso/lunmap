USE vspg;
SELECT *
FROM wlb
LEFT JOIN wwninfo
    ON wlb.wwn = wwninfo.wwn
    AND wlb.Port = wwninfo.Port
    AND wlb.HostgroupNum = wwninfo.HostgroupNum
    LEFT JOIN luninfo
        ON wwninfo.Hostgroup = luninfo.Hostgroup
        AND wwninfo.HostMode = luninfo.HostMode
        AND wwninfo.HostModeOption = luninfo.HostModeOption
        AND wwninfo.Port = luninfo.Port
        LEFT JOIN ldevinfo
            ON luninfo.LDEV = ldevinfo.LDEV
INTO OUTFILE '/media/psf/Home/Downloads/join.csv'
FIELDS TERMINATED BY ',';
