CREATE TABLE [HUMAN_R].[BRANCH_OFFICES] (
    [tin_id_branch_PK]  TINYINT      NOT NULL,
    [var_name]          VARCHAR (50) NULL,
    [big_id_address_FK] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([tin_id_branch_PK] ASC),
    CONSTRAINT [FK_ofice] FOREIGN KEY ([big_id_address_FK]) REFERENCES [HUMAN_R].[LIST_ADDRESS] ([big_address_id_PK])
);



