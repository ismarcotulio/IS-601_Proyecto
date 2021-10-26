CREATE TABLE [LOGISTIC].[MODEL] (
    [int_id_PK]         INT          IDENTITY (1, 1) NOT NULL,
    [var_name]          VARCHAR (50) NOT NULL,
    [tex_description]   TEXT         DEFAULT ('') NULL,
    [big_brand_FK]      BIGINT       NOT NULL,
    [int_body_class_FK] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC),
    FOREIGN KEY ([big_brand_FK]) REFERENCES [LOGISTIC].[BRAND] ([big_id_PK]),
    FOREIGN KEY ([int_body_class_FK]) REFERENCES [LOGISTIC].[BODY_CLASS] ([int_id_PK])
);









