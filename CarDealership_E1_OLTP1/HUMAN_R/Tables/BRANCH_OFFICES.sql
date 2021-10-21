CREATE TABLE [HUMAN_R].[BRANCH_OFFICES] (
    [tin_id_branch_PK]  TINYINT      NOT NULL,
    [var_name]          VARCHAR (50) NULL,
    [int_id_address_FK] INT          NULL,
    PRIMARY KEY CLUSTERED ([tin_id_branch_PK] ASC)
);

