use vspg;
CREATE TABLE lunmap
SELECT 
    wlb_server.System,
    wlb_server.Server,
    wlb_server.MigrationMethod,
    wlb_server.PowerHAorHACMP,
    wlb_server.Batch,
    wlb_server.Grp,
    wlb_hostgrp_wwn.Port,
    wlb_hostgrp_wwn.HostgroupNum,
    wlb_hostgrp_wwn.WWN,
    wwninfo.Hostgroup,
    wwninfo.HostMode,
    wwninfo.HostModeOption,
    luninfo.LUN,
    luninfo.LDEV,
    luninfo.NumberOfLDEVs,
    luninfo.CommandDevice,
    luninfo.CommandSecurity,
    luninfo.CVS,
    luninfo.CHALocation,
    luninfo.PackageType,
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
FROM wlb_server
INNER JOIN wlb_hostgrp_wwn
    ON wlb_server.System = wlb_hostgrp_wwn.System
    AND wlb_server.Server = wlb_hostgrp_wwn.Server
    INNER JOIN wwninfo
        ON wlb_hostgrp_wwn.Port = wwninfo.Port
        AND wlb_hostgrp_wwn.HostgroupNum = wwninfo.HostgroupNum
        AND wlb_hostgrp_wwn.WWN = wwninfo.WWN
        INNER JOIN luninfo
            ON wwninfo.Port = luninfo.Port
            AND wwninfo.Hostgroup = luninfo.Hostgroup
            AND wwninfo.HostMode = luninfo.HostMode
            AND wwninfo.HostModeOption = luninfo.HostModeOption
            INNER JOIN ldevinfo
                ON luninfo.LDEV = ldevinfo.LDEV;
