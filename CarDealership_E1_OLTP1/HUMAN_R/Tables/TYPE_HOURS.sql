CREATE TABLE [HUMAN_R].[TYPE_HOURS] (
    [tin_hourType_id_PK] TINYINT      NOT NULL,
    [flo_porcent]        FLOAT (53)   NOT NULL,
    [var_name]           VARCHAR (60) NOT NULL,
    PRIMARY KEY CLUSTERED ([tin_hourType_id_PK] ASC),
    CHECK ([flo_porcent]>(0))
);

