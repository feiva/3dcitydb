CREATE TABLE TUNNEL 
(
  ID NUMBER NOT NULL 
, TUNNEL_PARENT_ID NUMBER 
, TUNNEL_ROOT_ID NUMBER 
, CLASS VARCHAR2(256) 
, CLASS_CODESPACE VARCHAR2(4000) 
, FUNCTION VARCHAR2(1000) 
, FUNCTION_CODESPACE VARCHAR2(4000) 
, USAGE VARCHAR2(1000) 
, USAGE_CODESPACE VARCHAR2(4000) 
, YEAR_OF_CONSTRUCTION DATE 
, YEAR_OF_DEMOLITION DATE 
, LOD1_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD2_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD3_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD4_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY 
, LOD2_MULTI_CURVE MDSYS.SDO_GEOMETRY 
, LOD3_MULTI_CURVE MDSYS.SDO_GEOMETRY 
, LOD4_MULTI_CURVE MDSYS.SDO_GEOMETRY 
, LOD1_MULTI_SURFACE_ID NUMBER 
, LOD2_MULTI_SURFACE_ID NUMBER 
, LOD3_MULTI_SURFACE_ID NUMBER 
, LOD4_MULTI_SURFACE_ID NUMBER 
, LOD1_SOLID_ID NUMBER 
, LOD2_SOLID_ID NUMBER 
, LOD3_SOLID_ID NUMBER 
, LOD4_SOLID_ID NUMBER 
, CONSTRAINT TUNNEL_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TUNNEL_PK ON TUNNEL (ID ASC) 
      LOGGING 
      TABLESPACE "USERS" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX ON TUNNEL (LOD1_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX1 ON TUNNEL (LOD2_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX2 ON TUNNEL (LOD3_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX3 ON TUNNEL (LOD4_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX4 ON TUNNEL (TUNNEL_ROOT_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX5 ON TUNNEL (TUNNEL_PARENT_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX TUNNEL_FKX6 ON TUNNEL (LOD1_SOLID_ID ASC);

CREATE INDEX TUNNEL_FKX7 ON TUNNEL (LOD2_SOLID_ID ASC);

CREATE INDEX TUNNEL_FKX8 ON TUNNEL (LOD3_SOLID_ID ASC);

CREATE INDEX TUNNEL_FKX9 ON TUNNEL (LOD4_SOLID_ID ASC);

CREATE INDEX TUNNEL_LOD1TERR_SPX ON TUNNEL (LOD1_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX TUNNEL_LOD2MULTI_SPX ON TUNNEL (LOD2_MULTI_CURVE) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX TUNNEL_LOD2TERR_SPX ON TUNNEL (LOD2_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX TUNNEL_LOD3MULTI_SPX ON TUNNEL (LOD3_MULTI_CURVE) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX TUNNEL_LOD3TERR_SPX ON TUNNEL (LOD3_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX TUNNEL_LOD4MULTI_SPX ON TUNNEL (LOD4_MULTI_CURVE) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX TUNNEL_LOD4TERR_SPX ON TUNNEL (LOD4_TERRAIN_INTERSECTION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_CITYOBJECT_FK FOREIGN KEY
(
  ID 
)
REFERENCES CITYOBJECT
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK FOREIGN KEY
(
  LOD1_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK1 FOREIGN KEY
(
  LOD2_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK2 FOREIGN KEY
(
  LOD3_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK3 FOREIGN KEY
(
  LOD4_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK4 FOREIGN KEY
(
  LOD1_SOLID_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK5 FOREIGN KEY
(
  LOD2_SOLID_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK6 FOREIGN KEY
(
  LOD3_SOLID_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_SURFACE_GEOMETRY_FK7 FOREIGN KEY
(
  LOD4_SOLID_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_TUNNEL_FK FOREIGN KEY
(
  TUNNEL_PARENT_ID 
)
REFERENCES TUNNEL
(
  ID 
)
ENABLE;

ALTER TABLE TUNNEL
ADD CONSTRAINT TUNNEL_TUNNEL_FK1 FOREIGN KEY
(
  TUNNEL_ROOT_ID 
)
REFERENCES TUNNEL
(
  ID 
)
ENABLE;