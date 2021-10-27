CREATE TABLE [HUMAN_R].[CITIES] (
    [big_city_id_PK]        BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]              VARCHAR (60) NOT NULL,
    [big_departament_id_FK] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([big_city_id_PK] ASC),
    FOREIGN KEY ([big_departament_id_FK]) REFERENCES [HUMAN_R].[DEPARTAMENT] ([big_departament_id_PK]),
    CONSTRAINT [cities_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_PK] ASC)
);





