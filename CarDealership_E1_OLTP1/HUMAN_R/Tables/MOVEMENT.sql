CREATE TABLE [HUMAN_R].[MOVEMENT] (
    [int_movement_id_PK] INT   IDENTITY (1, 1) NOT NULL,
    [tex_description]    TEXT  NOT NULL,
    [int_factor]         INT   NOT NULL,
    [mon_amount]         MONEY NOT NULL,
    PRIMARY KEY CLUSTERED ([int_movement_id_PK] ASC),
    CHECK ([int_factor]=(-1) OR [int_factor]=(1))
);







