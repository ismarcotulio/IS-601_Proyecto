CREATE TABLE [LOGISTIC].[TYPE_MOVEMENT] (
    [tin_id_PK]       TINYINT      IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [tex_description] TEXT         DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([tin_id_PK] ASC),
    UNIQUE NONCLUSTERED ([var_name] ASC)
);





