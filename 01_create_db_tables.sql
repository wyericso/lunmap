CREATE DATABASE vspg;
USE vspg;
CREATE TABLE wlb (
    System VARCHAR(50),
    Server VARCHAR(50),
    Port VARCHAR(2),                # matches with wwninfo.Port
    HostgroupNum VARCHAR(2),        # matches with wwninfo.HostgroupNum
    WWN VARCHAR(16),                # matches with wwninfo.WWN
    MigrationMethod VARCHAR(50),
    PowerHAorHACMP VARCHAR(1)
);
CREATE TABLE wwninfo (
    Port VARCHAR(2),                # matches with wlb.Port, luninfo.Port
    Hostgroup VARCHAR(50),          # matches with luninfo.Hostgroup
    HostMode VARCHAR(50),           # matches with luninfo.HostMode
    HostModeOption VARCHAR(50),     # matches with luninfo.HostModeOption
    WWN VARCHAR(16),                # matches with wlb.WWN
    Nickname VARCHAR(50),
    HostgroupNum VARCHAR(2)         # matches with wlb.HostgroupNum
);
CREATE TABLE luninfo (
    Port VARCHAR(2),                # matches with wwninfo.Port
    Hostgroup VARCHAR(50),          # matches with wwninfo.Hostgroup
    HostMode VARCHAR(50),           # matches with wwninfo.HostMode
    HostModeOption VARCHAR(50),     # matches with wwninfo.HostModeOption
    LUN INT(11),
    LDEV VARCHAR(8),                # matches with ldevinfo.LDEV
    NumberOfLDEVs INT(11),
    CommandDevice VARCHAR(50),
    CommandSecurity VARCHAR(50),
    CVS VARCHAR(50),
    CHALocation VARCHAR(50),
    PackageType VARCHAR(50),
    ResourceGroupID VARCHAR(50),
    ResourceGroupName VARCHAR(50)
);
CREATE TABLE ldevinfo (
    ECCGroup VARCHAR(50),
    LDEV VARCHAR(50),               # matches with luninfo.LDEV
    LDEVName VARCHAR(50),
    LDEVEmulation VARCHAR(50),
    LDEVType VARCHAR(50),
    LDEVAttribute VARCHAR(50),
    VolumeSizeCyl INT,
    VolumeSizeMB DECIMAL(12,2),
    VolumeSizeBlocks BIGINT,
    CVS VARCHAR(50),
    LUSE VARCHAR(50),
    PoolID VARCHAR(50),
    RAIDConcatenation0 VARCHAR(50),
    RAIDConcatenation1 VARCHAR(50),
    RAIDConcatenation2 VARCHAR(50),
    OracleCheckSum VARCHAR(50),
    CurrentMPBlade VARCHAR(50),
    SettingMPBlade VARCHAR(50),
    Encryption VARCHAR(50),
    EncryptionKey VARCHAR(50),
    Allocated VARCHAR(50),
    PoolName VARCHAR(50),
    CmdDevSecurity VARCHAR(50),
    CmdDevUserAuth VARCHAR(50),
    CmdDevDevGrpDef VARCHAR(50),
    ResourceGroupID VARCHAR(50),
    ResourceGroupName VARCHAR(50)
);
