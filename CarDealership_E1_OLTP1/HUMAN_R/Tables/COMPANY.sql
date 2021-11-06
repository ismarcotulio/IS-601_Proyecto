CREATE TABLE [HUMAN_R].[COMPANY] (
    [int_company_id_PK] INT           IDENTITY (1, 1) NOT NULL,
    [var_name]          VARCHAR (150) NOT NULL,
    [var_RTN]           VARCHAR (14)  NOT NULL,
    [big_id_address_FK] BIGINT        NOT NULL,
    PRIMARY KEY CLUSTERED ([int_company_id_PK] ASC),
    FOREIGN KEY ([big_id_address_FK]) REFERENCES [HUMAN_R].[LIST_ADDRESS] ([big_address_id_PK])
);

