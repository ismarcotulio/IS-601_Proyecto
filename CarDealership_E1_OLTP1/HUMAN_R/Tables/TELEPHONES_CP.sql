CREATE TABLE [HUMAN_R].[TELEPHONES_CP] (
    [bit_active]         BIT    NOT NULL,
    [big_person_id_FK]   BIGINT NOT NULL,
    [big_telephon_id_FK] BIGINT NOT NULL,
    [int_company_id_FK]  INT    NULL,
    PRIMARY KEY CLUSTERED ([big_telephon_id_FK] ASC, [big_person_id_FK] ASC),
    CHECK ([int_company_id_FK]=NULL AND [big_person_id_FK]>(0) OR [int_company_id_FK]>(0) AND [big_person_id_FK]=NULL),
    FOREIGN KEY ([big_person_id_FK]) REFERENCES [HUMAN_R].[PERSON] ([big_person_id_PK]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([big_telephon_id_FK]) REFERENCES [HUMAN_R].[TELEPHONES] ([big_telephon_id_PK]),
    FOREIGN KEY ([int_company_id_FK]) REFERENCES [HUMAN_R].[COMPANY] ([int_company_id_PK])
);

