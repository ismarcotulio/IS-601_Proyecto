CREATE TABLE [HUMAN_R].[MOVEMENT] (
    [int_movement_id_PK] INT     IDENTITY (1, 1) NOT NULL,
    [tex_description]    TEXT    NOT NULL,
    [tin_factor]         TINYINT NOT NULL,
    [mon_amount]         MONEY   NOT NULL,
    PRIMARY KEY CLUSTERED ([int_movement_id_PK] ASC),
    CHECK ([tin_factor]=(-1) OR [tin_factor]=(1))
);





