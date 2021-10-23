CREATE TABLE [HUMAN_R].[DEPARTAMENT] (
    [big_departament_id_PK] BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]              VARCHAR (60) NOT NULL,
    [int_country_id_FK]     INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_departament_id_PK] ASC),
    FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK])
);



