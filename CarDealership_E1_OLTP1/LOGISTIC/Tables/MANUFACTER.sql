CREATE TABLE [LOGISTIC].[MANUFACTER] (
    [big_id_PK]       BIGINT       NOT NULL,
    [var_name]        VARCHAR (50) NULL,
    [var_commonName]  VARCHAR (50) NULL,
    [var_postalCode]  VARCHAR (50) NULL,
    [int_brand_FK]    INT          NULL,
    [tin_location_FK] TINYINT      NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC),
    FOREIGN KEY ([int_brand_FK]) REFERENCES [LOGISTIC].[COLOR] ([int_id_PK])
);

