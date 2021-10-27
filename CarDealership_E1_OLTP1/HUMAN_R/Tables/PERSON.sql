CREATE TABLE [HUMAN_R].[PERSON] (
    [big_person_id_PK]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_firstName]     VARCHAR (60) NOT NULL,
    [var_secondName]    VARCHAR (60) NOT NULL,
    [var_firstSurname]  VARCHAR (60) NOT NULL,
    [var_secondSurname] VARCHAR (60) NOT NULL,
    [var_DNI]           VARCHAR (13) NOT NULL,
    [dat_dateOfBirth]   DATE         NULL,
    [big_address_id_FK] BIGINT       NULL,
    [var_RTN_Personal]  VARCHAR (14) NULL,
    [cha_gender]        CHAR (1)     NOT NULL,
    PRIMARY KEY CLUSTERED ([big_person_id_PK] ASC),
    CONSTRAINT [PERSON_check] CHECK ([cha_gender]='M' OR [cha_gender]='m' OR ([cha_gender]='F' OR [cha_gender]='f')),
    FOREIGN KEY ([big_address_id_FK]) REFERENCES [HUMAN_R].[LIST_ADDRESS] ([big_address_id_PK])
);





