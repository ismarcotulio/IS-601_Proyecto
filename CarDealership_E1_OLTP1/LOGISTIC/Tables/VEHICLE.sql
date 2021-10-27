CREATE TABLE [LOGISTIC].[VEHICLE] (
    [big_id_PK]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [var_vin]              VARCHAR (45)    NOT NULL,
    [var_engine]           VARCHAR (100)   DEFAULT ('') NULL,
    [var_brake_system]     VARCHAR (50)    DEFAULT ('') NULL,
    [tin_number_cylinders] TINYINT         DEFAULT ((4)) NULL,
    [dec_displacement_cc]  DECIMAL (10, 3) DEFAULT ((0)) NULL,
    [var_gvwr]             VARCHAR (100)   DEFAULT ((0)) NULL,
    [bit_use_state]        BIT             DEFAULT ((1)) NULL,
    [tex_description]      TEXT            DEFAULT ('') NULL,
    [var_series]           VARCHAR (50)    DEFAULT ('') NULL,
    [int_year]             INT             DEFAULT ((2021)) NULL,
    [tin_doors]            TINYINT         DEFAULT ((4)) NULL,
    [int_color_FK]         INT             NOT NULL,
    [int_model_FK]         INT             NOT NULL,
    [tin_fuel_type_FK]     TINYINT         NOT NULL,
    [int_vehicle_type_FK]  INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC),
    FOREIGN KEY ([int_color_FK]) REFERENCES [LOGISTIC].[COLOR] ([int_id_PK]),
    FOREIGN KEY ([int_model_FK]) REFERENCES [LOGISTIC].[MODEL] ([int_id_PK]),
    FOREIGN KEY ([int_vehicle_type_FK]) REFERENCES [LOGISTIC].[VEHICLE_TYPE] ([int_id_PK]),
    FOREIGN KEY ([tin_fuel_type_FK]) REFERENCES [LOGISTIC].[FUEL_TYPE] ([tin_id_PK]),
    UNIQUE NONCLUSTERED ([var_vin] ASC)
);





