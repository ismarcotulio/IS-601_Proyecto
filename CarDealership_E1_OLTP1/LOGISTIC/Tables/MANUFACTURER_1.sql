CREATE TABLE [LOGISTIC].[MANUFACTURER] (
    [int_id_PK]       INT          IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [var_commonName]  VARCHAR (50) DEFAULT ('') NULL,
    [var_postalCode]  VARCHAR (50) DEFAULT ('') NULL,
    [tin_location_FK] TINYINT      DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC)
);

