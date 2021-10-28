CREATE TABLE [HUMAN_R].[TELEPHONES] (
    [big_telephon_id_PK] BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_number]         VARCHAR (12) NOT NULL,
    [big_person_id_FK]   BIGINT       NOT NULL,
    [int_country_id_FK]  INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_telephon_id_PK] ASC),
    FOREIGN KEY ([big_person_id_FK]) REFERENCES [HUMAN_R].[PERSON] ([big_person_id_PK]),
    FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK])
);





