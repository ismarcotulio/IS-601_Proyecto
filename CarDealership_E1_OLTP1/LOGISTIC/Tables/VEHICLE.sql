CREATE TABLE [LOGISTIC].[VEHICLE] (
    [big_id_PK]            BIGINT       IDENTITY (1, 100) NOT NULL,
    [var_vin]              VARCHAR (45) NULL,
    [int_kilometer]        INT          NULL,
    [tin_year_production]  TINYINT      NULL,
    [var_motor]            VARCHAR (50) NULL,
    [tin_number_cylinders] TINYINT      NULL,
    [bit_use_state]        BIT          NULL,
    [tex_description]      TEXT         NULL,
    [int_color_FK]         INT          NULL,
    [int_model_FK]         INT          NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC)
);

