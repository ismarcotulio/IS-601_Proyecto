CREATE TABLE [HUMAN_R].[CLIENT] (
    [big_client_id_PK]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_code]          VARCHAR (17) NULL,
    [int_company_id_FK] INT          NULL,
    [big_person_id_FK]  BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([big_client_id_PK] ASC),
    CHECK ([int_company_id_FK]=NULL AND [big_person_id_FK]>(0) OR [int_company_id_FK]>(0) AND [big_person_id_FK]=NULL),
    FOREIGN KEY ([big_person_id_FK]) REFERENCES [HUMAN_R].[PERSON] ([big_person_id_PK]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([int_company_id_FK]) REFERENCES [HUMAN_R].[COMPANY] ([int_company_id_PK])
);

