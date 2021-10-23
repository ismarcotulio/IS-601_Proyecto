CREATE TABLE [LOGISTIC].[MANUFACTER] (
    [big_id_PK]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [var_commonName]  VARCHAR (50) DEFAULT ('') NULL,
    [var_postalCode]  VARCHAR (50) DEFAULT ('') NULL,
    [int_brand_FK]    INT          NOT NULL,
    [tin_location_FK] TINYINT      DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC),
    FOREIGN KEY ([int_brand_FK]) REFERENCES [LOGISTIC].[COLOR] ([int_id_PK])
);



