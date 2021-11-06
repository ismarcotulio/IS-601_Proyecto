CREATE TABLE [HUMAN_R].[TELEPHONES] (
    [big_telephon_id_PK]     BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_number]             VARCHAR (12) NOT NULL,
    [tin_telephonType_id_FK] TINYINT      NOT NULL,
    [int_country_id_FK]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_telephon_id_PK] ASC),
    FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK]),
    FOREIGN KEY ([tin_telephonType_id_FK]) REFERENCES [HUMAN_R].[TELEPHONES_TYPE] ([tin_telephonType_id_PK])
);







