CREATE TABLE [LOGISTIC].[BRAND] (
    [int_id_PK]       INT          IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [tex_description] TEXT         DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC)
);



