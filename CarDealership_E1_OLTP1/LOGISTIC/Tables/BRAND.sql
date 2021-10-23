CREATE TABLE [LOGISTIC].[BRAND] (
    [big_id_PK]           BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]            VARCHAR (50) NOT NULL,
    [tex_description]     TEXT         DEFAULT ('') NULL,
    [int_manufacturer_FK] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC),
    FOREIGN KEY ([int_manufacturer_FK]) REFERENCES [LOGISTIC].[MANUFACTURER] ([int_id_PK]),
    UNIQUE NONCLUSTERED ([var_name] ASC)
);





