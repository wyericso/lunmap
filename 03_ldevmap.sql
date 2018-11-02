use vspg;
CREATE TABLE ldevmap
SELECT DISTINCT
    wlb.System,
    wlb.Server,
    wlb.MigrationMethod,
    wlb.PowerHAorHACMP,
    luninfo.LDEV,
    luninfo.NumberOfLDEVs,
    ldevinfo.ECCGroup,
    ldevinfo.LDEVName,
    ldevinfo.LDEVEmulation,
    ldevinfo.LDEVType,
    ldevinfo.LDEVAttribute,
    ldevinfo.VolumeSizeCyl,
    ldevinfo.VolumeSizeMB,
    ldevinfo.VolumeSizeBlocks,
    ldevinfo.LUSE,
    ldevinfo.PoolID,
    ldevinfo.RAIDConcatenation0,
    ldevinfo.RAIDConcatenation1,
    ldevinfo.RAIDConcatenation2,
    ldevinfo.OracleCheckSum,
    ldevinfo.CurrentMPBlade,
    ldevinfo.SettingMPBlade,
    ldevinfo.Encryption,
    ldevinfo.EncryptionKey,
    ldevinfo.Allocated,
    ldevinfo.PoolName,
    ldevinfo.CmdDevSecurity,
    ldevinfo.CmdDevUserAuth,
    ldevinfo.CmdDevDevGrpDef
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
            ON luninfo.LDEV = ldevinfo.LDEV;
