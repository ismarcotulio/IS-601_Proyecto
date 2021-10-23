CREATE TABLE [LOGISTIC].[VEHICLE] (
    [big_id_PK]            BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_vin]              VARCHAR (45) NOT NULL,
    [int_kilometer]        INT          DEFAULT ((0)) NULL,
    [tin_year_production]  TINYINT      DEFAULT ((2001)) NULL,
    [var_motor]            VARCHAR (50) DEFAULT ('') NULL,
    [tin_number_cylinders] TINYINT      DEFAULT ((4)) NULL,
    [bit_use_state]        BIT          DEFAULT ((1)) NULL,
    [tex_description]      TEXT         DEFAULT ('') NULL,
    [int_color_FK]         INT          NOT NULL,
    [int_model_FK]         INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC),
    FOREIGN KEY ([int_color_FK]) REFERENCES [LOGISTIC].[COLOR] ([int_id_PK]),
    FOREIGN KEY ([int_model_FK]) REFERENCES [LOGISTIC].[MODEL] ([int_id_PK])
);



