CREATE TABLE [HUMAN_R].[LIST_ADDRESS] (
    [big_address_id_PK]     BIGINT IDENTITY (1, 1) NOT NULL,
    [tex_reference]         TEXT   NOT NULL,
    [int_country_id_FK]     INT    NOT NULL,
    [big_departament_id_FK] BIGINT NOT NULL,
    [big_city_id_FK]        BIGINT NOT NULL,
    [big_suburn_id_FK]      BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([big_address_id_PK] ASC),
    FOREIGN KEY ([big_city_id_FK]) REFERENCES [HUMAN_R].[CITIES] ([big_city_id_PK]),
    FOREIGN KEY ([big_departament_id_FK]) REFERENCES [HUMAN_R].[DEPARTAMENT] ([big_departament_id_PK]),
    FOREIGN KEY ([big_suburn_id_FK]) REFERENCES [HUMAN_R].[SUBURN] ([big_suburn_id_PK]),
    FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK])
);



