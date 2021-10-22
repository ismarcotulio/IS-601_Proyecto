CREATE TABLE [HUMAN_R].[MOVEMENT] (
    [int_movement_id_PK] INT        NOT NULL,
    [tex_description]    TEXT       NOT NULL,
    [tin_factor]         TINYINT    NOT NULL,
    [flo_porcent]        FLOAT (53) NOT NULL,
    PRIMARY KEY CLUSTERED ([int_movement_id_PK] ASC),
    CHECK ([flo_porcent]>(0)),
    CHECK ([tin_factor]=(-1) OR [tin_factor]=(1))
);

