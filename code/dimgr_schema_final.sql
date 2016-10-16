--
-- COLUMNS  (Table) 
--
CREATE TABLE DIMGR.COLUMNS
(
  OWNER                       VARCHAR2(30 BYTE) CONSTRAINT SYS_C0040423 NOT NULL,
  TABLE_NAME                  VARCHAR2(30 BYTE) CONSTRAINT SYS_C0040424 NOT NULL,
  COLUMN_NAME                 VARCHAR2(30 BYTE) CONSTRAINT SYS_C0040426 NOT NULL,
  COLUMN_ID                   NUMBER CONSTRAINT SYS_C0040425 NOT NULL,
  DATA_TYPE                   VARCHAR2(106 BYTE) CONSTRAINT SYS_C0040427 NOT NULL,
  DATA_LENGTH                 NUMBER,
  DATA_PRECISION              NUMBER,
  DATA_SCALE                  NUMBER,
  COLUMN_DESC                 VARCHAR2(100 BYTE),
  COLUMN_COMMENT              VARCHAR2(500 BYTE),
  NULLABLE                    VARCHAR2(1 BYTE) CONSTRAINT SYS_C0040428 NOT NULL,
  CONSTRAINT_DESC             VARCHAR2(500 BYTE),
  CONSTRAINT_CHECK_CONDITION  CLOB,
  CONSTRAINT_VALIDATION_QRY   CLOB,
  CONSTRAINT_NAME             VARCHAR2(50 BYTE)
)
LOB (CONSTRAINT_CHECK_CONDITION) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
LOB (CONSTRAINT_VALIDATION_QRY) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE DIMGR.COLUMNS IS 'This table records the column-level constraints'
/

COMMENT ON COLUMN DIMGR.COLUMNS.DATA_LENGTH IS 'Length of the column (in bytes)'
/

COMMENT ON COLUMN DIMGR.COLUMNS.CONSTRAINT_CHECK_CONDITION IS 'Check constraint condition, without the CHECK keyword'
/


--
-- CONSTRAINT_TYPES  (Table) 
--
CREATE TABLE DIMGR.CONSTRAINT_TYPES
(
  TYPE       VARCHAR2(20 BYTE)                  NOT NULL,
  TYPE_DESC  VARCHAR2(200 BYTE),
  "COMMENT"  VARCHAR2(500 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE DIMGR.CONSTRAINT_TYPES IS 'Type of the constraint (table-level or inter-table-level): PK, FK, UNIQUE, TABLE-LEVEL, INTER-TABLE-LEVEL'
/


--
-- DIRESULTS  (Table) 
--
CREATE TABLE DIMGR.DIRESULTS
(
  TEST_ID          NUMBER(10),
  OWNER            VARCHAR2(30 BYTE),
  TABLE_NAME       VARCHAR2(30 BYTE),
  COLUMN_NAME      VARCHAR2(30 BYTE),
  CONSTRAINT_NAME  VARCHAR2(500 BYTE),
  RESULT           NUMBER(12),
  POPULATION_DATE  DATE
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- DIRESULTS2  (Table) 
--
CREATE TABLE DIMGR.DIRESULTS2
(
  TEST_ID          NUMBER(10),
  OWNER            VARCHAR2(30 BYTE),
  TABLE_NAME       VARCHAR2(30 BYTE),
  COLUMN_NAME      VARCHAR2(30 BYTE),
  CONSTRAINT_NAME  VARCHAR2(500 BYTE),
  RESULT           NUMBER(12),
  POPULATION_DATE  DATE
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- INTER_TABLE_CONSTRAINTS  (Table) 
--
CREATE TABLE DIMGR.INTER_TABLE_CONSTRAINTS
(
  OWNER                      VARCHAR2(30 BYTE)  NOT NULL,
  TABLE_NAME                 VARCHAR2(30 BYTE)  NOT NULL,
  CONSTRAINT_NAME            VARCHAR2(50 BYTE) CONSTRAINT SYS_C0040436 NOT NULL,
  CONSTRAINT_DESC            VARCHAR2(500 BYTE),
  CONSTRAINT_VALIDATION_QRY  CLOB,
  TYPE                       VARCHAR2(20 BYTE),
  REF_PKOWNER                VARCHAR2(30 BYTE),
  REF_PKTABLE_NAME           VARCHAR2(30 BYTE),
  REF_PKCONSTRAINT_NAME      VARCHAR2(50 BYTE)
)
LOB (CONSTRAINT_VALIDATION_QRY) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- INTER_TABLE_CONS_REF_TABLES  (Table) 
--
CREATE TABLE DIMGR.INTER_TABLE_CONS_REF_TABLES
(
  CONSTRAINT_NAME  VARCHAR2(50 BYTE) CONSTRAINT SYS_C0040432 NOT NULL,
  OWNER            VARCHAR2(30 BYTE)            NOT NULL,
  TABLE_NAME       VARCHAR2(30 BYTE)            NOT NULL,
  REF_OWNER        VARCHAR2(30 BYTE)            NOT NULL,
  REF_TABLE_NAME   VARCHAR2(30 BYTE)            NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- ITABLE_CONSTRAINTS_REF_COLUMNS  (Table) 
--
CREATE TABLE DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS
(
  OWNER            VARCHAR2(30 BYTE)            NOT NULL,
  TABLE_NAME       VARCHAR2(30 BYTE)            NOT NULL,
  CONSTRAINT_NAME  VARCHAR2(50 BYTE)            NOT NULL,
  COLUMN_NAME      VARCHAR2(30 BYTE)            NOT NULL,
  POSITION         NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- LALA  (Table) 
--
CREATE TABLE DIMGR.LALA
(
  XXX  NUMBER,
  Y    NUMBER,
  Z    NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE DIMGR.LALA IS 'this is a new comment'
/

COMMENT ON COLUMN DIMGR.LALA.Y IS 'ASAXS'
/


--
-- LALA2  (Table) 
--
CREATE TABLE DIMGR.LALA2
(
  X  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- OUTPUT  (Table) 
--
CREATE TABLE DIMGR.OUTPUT
(
  TEXT  VARCHAR2(4000 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- SRCH_COND  (Table) 
--
CREATE TABLE DIMGR.SRCH_COND
(
  OWNER             VARCHAR2(30 BYTE),
  TABLE_NAME        VARCHAR2(30 BYTE),
  COLUMN_NAME       VARCHAR2(30 BYTE),
  SEARCH_CONDITION  CLOB,
  CONSTRAINT_NAME   VARCHAR2(50 BYTE)
)
LOB (SEARCH_CONDITION) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TABLES  (Table) 
--
CREATE TABLE DIMGR.TABLES
(
  OWNER          VARCHAR2(30 BYTE) CONSTRAINT SYS_C0040442 NOT NULL,
  TABLE_NAME     VARCHAR2(30 BYTE) CONSTRAINT SYS_C0040443 NOT NULL,
  TABLE_DESC     VARCHAR2(150 BYTE),
  TABLE_COMMENT  VARCHAR2(500 BYTE),
  TABLE_TYPE     VARCHAR2(20 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON COLUMN DIMGR.TABLES.TABLE_DESC IS 'Records the description of the table.'
/

COMMENT ON COLUMN DIMGR.TABLES.TABLE_TYPE IS 'FACT  DIMENSION ACTIVITY SNAPSHOT'
/


--
-- TABLE_CONSTRAINTS  (Table) 
--
CREATE TABLE DIMGR.TABLE_CONSTRAINTS
(
  OWNER                      VARCHAR2(30 BYTE)  NOT NULL,
  TABLE_NAME                 VARCHAR2(30 BYTE)  NOT NULL,
  CONSTRAINT_NAME            VARCHAR2(50 BYTE)  NOT NULL,
  CONSTRAINT_DESC            VARCHAR2(500 BYTE),
  CONSTRAINT_VALIDATION_QRY  CLOB,
  TYPE                       VARCHAR2(20 BYTE)
)
LOB (CONSTRAINT_VALIDATION_QRY) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TABLE_CONSTRAINTS_REF_COLUMNS  (Table) 
--
CREATE TABLE DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS
(
  OWNER            VARCHAR2(30 BYTE)            NOT NULL,
  TABLE_NAME       VARCHAR2(30 BYTE)            NOT NULL,
  CONSTRAINT_NAME  VARCHAR2(50 BYTE)            NOT NULL,
  COLUMN_NAME      VARCHAR2(30 BYTE)            NOT NULL,
  POSITION         NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON COLUMN DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS.POSITION IS 'Position of the column in the PK/UK constraint.'
/


--
-- TUPLES  (Table) 
--
CREATE TABLE DIMGR.TUPLES
(
  OWNER       VARCHAR2(30 BYTE)                 NOT NULL,
  TABLE_NAME  VARCHAR2(30 BYTE)                 NOT NULL,
  TUPLE_DESC  VARCHAR2(250 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON COLUMN DIMGR.TUPLES.TUPLE_DESC IS 'what each tuple represents in english'
/


--
-- TUPLE_CONSTRAINTS  (Table) 
--
CREATE TABLE DIMGR.TUPLE_CONSTRAINTS
(
  OWNER                       VARCHAR2(30 BYTE) NOT NULL,
  TABLE_NAME                  VARCHAR2(30 BYTE) NOT NULL,
  CONSTRAINT_NAME             VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT_DESC             VARCHAR2(500 BYTE),
  CONSTRAINT_CHECK_CONDITION  CLOB,
  CONSTRAINT_VALIDATION_QRY   CLOB
)
LOB (CONSTRAINT_CHECK_CONDITION) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
LOB (CONSTRAINT_VALIDATION_QRY) STORE AS (
  TABLESPACE USERS
  ENABLE       STORAGE IN ROW
  CHUNK       32768
  RETENTION
  NOCACHE
  LOGGING
  INDEX       (
        TABLESPACE USERS
        STORAGE    (
                    INITIAL          160K
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   ))
      STORAGE    (
                  INITIAL          160K
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TUPLE_CONSTRAINTS_REF_COLUMNS  (Table) 
--
CREATE TABLE DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(
  OWNER            VARCHAR2(30 BYTE)            NOT NULL,
  TABLE_NAME       VARCHAR2(30 BYTE)            NOT NULL,
  CONSTRAINT_NAME  VARCHAR2(50 BYTE)            NOT NULL,
  COLUMN_NAME      VARCHAR2(30 BYTE)            NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- "Key4"  (Index) 
--
CREATE UNIQUE INDEX DIMGR."Key4" ON DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- "Key5"  (Index) 
--
CREATE UNIQUE INDEX DIMGR."Key5" ON DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS
(CONSTRAINT_NAME, OWNER, TABLE_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- LALAPK  (Index) 
--
CREATE UNIQUE INDEX DIMGR.LALAPK ON DIMGR.LALA
(Y, Z, XXX)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- NEWPK  (Index) 
--
CREATE UNIQUE INDEX DIMGR.NEWPK ON DIMGR.LALA
(XXX)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- NEWUK  (Index) 
--
CREATE UNIQUE INDEX DIMGR.NEWUK ON DIMGR.LALA
(Z, XXX)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF1COLUMNS  (Index) 
--
CREATE INDEX DIMGR.XIF1COLUMNS ON DIMGR.COLUMNS
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF1INTER_TABLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF1INTER_TABLE_CONSTRAINTS ON DIMGR.INTER_TABLE_CONSTRAINTS
(TYPE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF1TABLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF1TABLE_CONSTRAINTS ON DIMGR.TABLE_CONSTRAINTS
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF1TUPLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF1TUPLE_CONSTRAINTS ON DIMGR.TUPLE_CONSTRAINTS
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF1TUPLE_CONSTRAINTS_REF_COLU  (Index) 
--
CREATE INDEX DIMGR.XIF1TUPLE_CONSTRAINTS_REF_COLU ON DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF2TABLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF2TABLE_CONSTRAINTS ON DIMGR.TABLE_CONSTRAINTS
(TYPE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XIF2TUPLE_CONSTRAINTS_REF_COLU  (Index) 
--
CREATE INDEX DIMGR.XIF2TUPLE_CONSTRAINTS_REF_COLU ON DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKCOLUMNS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKCOLUMNS ON DIMGR.COLUMNS
(OWNER, TABLE_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKCONSTRAINT_TYPES  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKCONSTRAINT_TYPES ON DIMGR.CONSTRAINT_TYPES
(TYPE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKINTER_TABLE_CONSTRAINTS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKINTER_TABLE_CONSTRAINTS ON DIMGR.INTER_TABLE_CONSTRAINTS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKINTER_TABLE_CONSTRAINTS_REF  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKINTER_TABLE_CONSTRAINTS_REF ON DIMGR.INTER_TABLE_CONS_REF_TABLES
(CONSTRAINT_NAME, OWNER, TABLE_NAME, REF_OWNER, REF_TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKTABLES  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTABLES ON DIMGR.TABLES
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKTABLE_CONSTRAINTS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTABLE_CONSTRAINTS ON DIMGR.TABLE_CONSTRAINTS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKTUPLES  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTUPLES ON DIMGR.TUPLES
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKTUPLE_CONSTRAINTS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTUPLE_CONSTRAINTS ON DIMGR.TUPLE_CONSTRAINTS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- XPKTUPLE_CONSTRAINTS_REF_COLUM  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTUPLE_CONSTRAINTS_REF_COLUM ON DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table COLUMNS 
-- 
ALTER TABLE DIMGR.COLUMNS ADD (
  CONSTRAINT CHECK_NULLABLE_COL
  CHECK (nullable in ('Y', 'N')),
  CONSTRAINT SYS_C0040429
  PRIMARY KEY
  (OWNER, TABLE_NAME, COLUMN_NAME)
  USING INDEX DIMGR.XPKCOLUMNS)
/

-- 
-- Non Foreign Key Constraints for Table CONSTRAINT_TYPES 
-- 
ALTER TABLE DIMGR.CONSTRAINT_TYPES ADD (
  PRIMARY KEY
  (TYPE)
  USING INDEX DIMGR.XPKCONSTRAINT_TYPES)
/

-- 
-- Non Foreign Key Constraints for Table INTER_TABLE_CONSTRAINTS 
-- 
ALTER TABLE DIMGR.INTER_TABLE_CONSTRAINTS ADD (
  CONSTRAINT SYS_C0040437
  PRIMARY KEY
  (OWNER, TABLE_NAME, CONSTRAINT_NAME)
  USING INDEX DIMGR.XPKINTER_TABLE_CONSTRAINTS)
/

-- 
-- Non Foreign Key Constraints for Table INTER_TABLE_CONS_REF_TABLES 
-- 
ALTER TABLE DIMGR.INTER_TABLE_CONS_REF_TABLES ADD (
  CONSTRAINT SYS_C0040435
  PRIMARY KEY
  (CONSTRAINT_NAME, OWNER, TABLE_NAME, REF_OWNER, REF_TABLE_NAME)
  USING INDEX DIMGR.XPKINTER_TABLE_CONSTRAINTS_REF)
/

-- 
-- Non Foreign Key Constraints for Table ITABLE_CONSTRAINTS_REF_COLUMNS 
-- 
ALTER TABLE DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS ADD (
  CONSTRAINT "Key5"
  PRIMARY KEY
  (CONSTRAINT_NAME, OWNER, TABLE_NAME, COLUMN_NAME))
/

-- 
-- Non Foreign Key Constraints for Table LALA 
-- 
ALTER TABLE DIMGR.LALA ADD (
  CONSTRAINT MYCON
  CHECK (XXX < 75),
  CONSTRAINT MYCON1
  CHECK (xxx*y < 30 and not(y < 0)),
  CONSTRAINT MYCON2
  CHECK (xxx+y > 30 and not(y < 400)),
  CONSTRAINT MYCON3
  CHECK (XXX < 175),
  CONSTRAINT SYS_C0040498
  CHECK (Y<= 200 or Y >= 1000),
  CONSTRAINT SYS_C0040499
  CHECK (xxx <= 20),
  CONSTRAINT LALAPK
  PRIMARY KEY
  (Y, Z, XXX)
  USING INDEX DIMGR.LALAPK,
  CONSTRAINT LALALUK
  UNIQUE (XXX, Y, Z)
  USING INDEX DIMGR.LALAPK,
  CONSTRAINT NEWPK
  UNIQUE (XXX)
  USING INDEX DIMGR.NEWPK,
  CONSTRAINT NEWUK
  UNIQUE (Z, XXX)
  USING INDEX DIMGR.NEWUK)
/

-- 
-- Non Foreign Key Constraints for Table LALA2 
-- 
ALTER TABLE DIMGR.LALA2 ADD (
  PRIMARY KEY
  (X)
  USING INDEX
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          160K
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Non Foreign Key Constraints for Table TABLES 
-- 
ALTER TABLE DIMGR.TABLES ADD (
  CONSTRAINT SYS_C0040444
  PRIMARY KEY
  (OWNER, TABLE_NAME)
  USING INDEX DIMGR.XPKTABLES)
/

-- 
-- Non Foreign Key Constraints for Table TABLE_CONSTRAINTS 
-- 
ALTER TABLE DIMGR.TABLE_CONSTRAINTS ADD (
  PRIMARY KEY
  (OWNER, TABLE_NAME, CONSTRAINT_NAME)
  USING INDEX DIMGR.XPKTABLE_CONSTRAINTS)
/

-- 
-- Non Foreign Key Constraints for Table TABLE_CONSTRAINTS_REF_COLUMNS 
-- 
ALTER TABLE DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS ADD (
  CONSTRAINT "Key4"
  PRIMARY KEY
  (OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME))
/

-- 
-- Non Foreign Key Constraints for Table TUPLES 
-- 
ALTER TABLE DIMGR.TUPLES ADD (
  PRIMARY KEY
  (OWNER, TABLE_NAME)
  USING INDEX DIMGR.XPKTUPLES)
/

-- 
-- Non Foreign Key Constraints for Table TUPLE_CONSTRAINTS 
-- 
ALTER TABLE DIMGR.TUPLE_CONSTRAINTS ADD (
  PRIMARY KEY
  (OWNER, TABLE_NAME, CONSTRAINT_NAME)
  USING INDEX DIMGR.XPKTUPLE_CONSTRAINTS)
/

-- 
-- Non Foreign Key Constraints for Table TUPLE_CONSTRAINTS_REF_COLUMNS 
-- 
ALTER TABLE DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS ADD (
  PRIMARY KEY
  (OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME)
  USING INDEX DIMGR.XPKTUPLE_CONSTRAINTS_REF_COLUM)
/

-- 
-- Foreign Key Constraints for Table COLUMNS 
-- 
ALTER TABLE DIMGR.COLUMNS ADD (
  CONSTRAINT SYS_C0040457 
  FOREIGN KEY (OWNER, TABLE_NAME) 
  REFERENCES DIMGR.TABLES (OWNER,TABLE_NAME))
/

-- 
-- Foreign Key Constraints for Table INTER_TABLE_CONSTRAINTS 
-- 
ALTER TABLE DIMGR.INTER_TABLE_CONSTRAINTS ADD (
  CONSTRAINT FK_REFS_PKCON 
  FOREIGN KEY (REF_PKOWNER, REF_PKTABLE_NAME, REF_PKCONSTRAINT_NAME) 
  REFERENCES DIMGR.TABLE_CONSTRAINTS (OWNER,TABLE_NAME,CONSTRAINT_NAME),
  CONSTRAINT IT_CON_HAS_TYPE 
  FOREIGN KEY (TYPE) 
  REFERENCES DIMGR.CONSTRAINT_TYPES (TYPE)
  ON DELETE SET NULL,
  CONSTRAINT TBL_ISREFBY_ITCON 
  FOREIGN KEY (OWNER, TABLE_NAME) 
  REFERENCES DIMGR.TABLES (OWNER,TABLE_NAME))
/

-- 
-- Foreign Key Constraints for Table INTER_TABLE_CONS_REF_TABLES 
-- 
ALTER TABLE DIMGR.INTER_TABLE_CONS_REF_TABLES ADD (
  CONSTRAINT ITCON_REF_TABLES 
  FOREIGN KEY (OWNER, TABLE_NAME, CONSTRAINT_NAME) 
  REFERENCES DIMGR.INTER_TABLE_CONSTRAINTS (OWNER,TABLE_NAME,CONSTRAINT_NAME),
  CONSTRAINT TBL_ISREFBY_ITCON_REFT 
  FOREIGN KEY (REF_OWNER, REF_TABLE_NAME) 
  REFERENCES DIMGR.TABLES (OWNER,TABLE_NAME))
/

-- 
-- Foreign Key Constraints for Table ITABLE_CONSTRAINTS_REF_COLUMNS 
-- 
ALTER TABLE DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS ADD (
  CONSTRAINT COL_IS_REFBY_ITCON 
  FOREIGN KEY (OWNER, TABLE_NAME, COLUMN_NAME) 
  REFERENCES DIMGR.COLUMNS (OWNER,TABLE_NAME,COLUMN_NAME))
/

-- 
-- Foreign Key Constraints for Table LALA 
-- 
ALTER TABLE DIMGR.LALA ADD (
  CONSTRAINT LALAFK 
  FOREIGN KEY (Z) 
  REFERENCES DIMGR.LALA2 (X)  DISABLE)
/

-- 
-- Foreign Key Constraints for Table TABLE_CONSTRAINTS 
-- 
ALTER TABLE DIMGR.TABLE_CONSTRAINTS ADD (
  CONSTRAINT SYS_C0040461 
  FOREIGN KEY (OWNER, TABLE_NAME) 
  REFERENCES DIMGR.TABLES (OWNER,TABLE_NAME),
  CONSTRAINT T_CON_HAS_TYPE 
  FOREIGN KEY (TYPE) 
  REFERENCES DIMGR.CONSTRAINT_TYPES (TYPE)
  ON DELETE SET NULL)
/

-- 
-- Foreign Key Constraints for Table TABLE_CONSTRAINTS_REF_COLUMNS 
-- 
ALTER TABLE DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS ADD (
  CONSTRAINT COL_IS_REFBY_TCON 
  FOREIGN KEY (OWNER, TABLE_NAME, COLUMN_NAME) 
  REFERENCES DIMGR.COLUMNS (OWNER,TABLE_NAME,COLUMN_NAME),
  CONSTRAINT T_CON_REF_COLS 
  FOREIGN KEY (OWNER, TABLE_NAME, CONSTRAINT_NAME) 
  REFERENCES DIMGR.TABLE_CONSTRAINTS (OWNER,TABLE_NAME,CONSTRAINT_NAME))
/

-- 
-- Foreign Key Constraints for Table TUPLES 
-- 
ALTER TABLE DIMGR.TUPLES ADD (
  CONSTRAINT SYS_C0040466 
  FOREIGN KEY (OWNER, TABLE_NAME) 
  REFERENCES DIMGR.TABLES (OWNER,TABLE_NAME))
/

-- 
-- Foreign Key Constraints for Table TUPLE_CONSTRAINTS 
-- 
ALTER TABLE DIMGR.TUPLE_CONSTRAINTS ADD (
  FOREIGN KEY (OWNER, TABLE_NAME) 
  REFERENCES DIMGR.TUPLES (OWNER,TABLE_NAME))
/

-- 
-- Foreign Key Constraints for Table TUPLE_CONSTRAINTS_REF_COLUMNS 
-- 
ALTER TABLE DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS ADD (
  FOREIGN KEY (OWNER, TABLE_NAME, CONSTRAINT_NAME) 
  REFERENCES DIMGR.TUPLE_CONSTRAINTS (OWNER,TABLE_NAME,CONSTRAINT_NAME),
  CONSTRAINT SYS_C0040465 
  FOREIGN KEY (OWNER, TABLE_NAME, COLUMN_NAME) 
  REFERENCES DIMGR.COLUMNS (OWNER,TABLE_NAME,COLUMN_NAME))
/

GRANT SELECT ON DIMGR.DIRESULTS TO PUBLIC
/

GRANT SELECT ON DIMGR.OUTPUT TO PUBLIC
/
--
-- DIMGR_PKG  (Package) 
--
CREATE OR REPLACE PACKAGE DIMGR.DIMGR_PKG  AS

/**
scope: import a table from the db catalog into the dimgr schema.

@params
    tblowner   owner of the table
    name    name of the table
    overwrite   string conatining the output of a checkbox indicating if some filed will be overwrited. In particular, the string is of the from:
                    '0:1:2', '0:2', etc. depending on which boxes have been checked. Table Comments --> 0,Column Comments --> 1,Column Check Constraints-->2
@author nkarag
*/
procedure import_table_from_db(
    tblowner   in  varchar2
    ,name   in  varchar2    
    ,overwrite in varchar2
);

/**
scope: purge a table from the DIMGR repository

@params
    tblowner   owner of the table
    name    name of the table
@author nkarag
*/
procedure purge_table_from_repository(
    tblowner   in  varchar2
    ,name   in  varchar2    
);

/**
scope: update table COLUMNS from the corresponding apex from
@params     column values of the row to be updated

begin
dimgr.DIMGR_PKG.update_tab_columns(
OWNER => :P14_OWNER
,TABLE_NAME => :P14_TABLE_NAME
,COLUMN_NAME => :P14_COLUMN_NAME
,COLUMN_ID => :P14_COLUMN_ID
,DATA_TYPE => :P14_DATA_TYPE
,DATA_LENGTH => :P14_DATA_LENGTH
,DATA_PRECISION => :P14_DATA_PRECISION
,DATA_SCALE => :P14_DATA_SCALE
,COLUMN_DESC => :P14_COLUMN_DESC
,COLUMN_COMMENT => :P14_COLUMN_COMMENT
,NULLABLE => :P14_NULLABLE
,CONSTRAINT_DESC => :P14_CONSTRAINT_DESC
,CONSTRAINT_CHECK_CONDITION => :P14_CONSTRAINT_CHECK_CONDITION
,CONSTRAINT_VALIDATION_QRY => :P14_CONSTRAINT_VALIDATION_QRY
,CONSTRAINT_NAME => :P14_CONSTRAINT_NAME
);
end;

*/
procedure update_tab_columns(
  OWNER                       VARCHAR2,
  TABLE_NAME                  VARCHAR2,
  COLUMN_NAME                 VARCHAR2,
  COLUMN_ID                   NUMBER  ,  
  DATA_TYPE                   VARCHAR2,
  DATA_LENGTH                 NUMBER,
  DATA_PRECISION              NUMBER,
  DATA_SCALE                  NUMBER,
  COLUMN_DESC                 VARCHAR2,
  COLUMN_COMMENT              VARCHAR2,
  NULLABLE                    VARCHAR2,
  CONSTRAINT_DESC             VARCHAR2,
  CONSTRAINT_CHECK_CONDITION  CLOB,
  CONSTRAINT_VALIDATION_QRY   CLOB,
  CONSTRAINT_NAME             VARCHAR2
);

procedure testhtml;

/**
scope: generate script (in html format) with DDL commands in order to update DB
based on the rows of the DIMGR.COLUMNS table


@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
*/
procedure genHTMLupdDBscriptFromColumns (
    tblowner in varchar2
    ,tblname in varchar2
);


/**
scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
based on the rows of the DIMGR.COLUMNS table. The items updated are:
    1. column comments
    2. column not null constraints --> ONLY if the current constraint in all_tab_columns is different than the one recorded in
       DIMGR.COLUMNS.nullable
    3. Columns Check constraint

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        null_con_status     specifies the requested status of the NOT NULL constraint that will be created through the DDL.
                            0 --> NOT NULL will be enabled and validated 
                            1 --> NOT NULL will be enabled but novalidate
                            2 --> NOT NULL will be disabled
        check_con_status    specifies the requested status of the CHECK constraint that will be created through the DDL.
                            0 --> NOT NULL will be enabled and validated 
                            1 --> NOT NULL will be enabled but novalidate
                            2 --> NOT NULL will be disabled
                            
*/
procedure genupdDBscriptFromColumns (
    tblowner in varchar2
    ,tblname in varchar2
    ,null_con_status in number
    ,check_con_status in number
);

/**
scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
based on the rows of the DIMGR.TUPLE_CONSTRAINTS table. The items updated are:
        1. Columns Check constraint

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        check_con_status    specifies the requested status of the CHECK constraint that will be created through the DDL.
                            0 --> check con will be enabled and validated 
                            1 --> check con will be enabled but novalidate
                            2 --> check con will be disabled
                            
*/
procedure genupdDBscriptFromTupCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,check_con_status in number
);

/**
scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
based on the rows of the DIMGR.TABLE_CONSTRAINTS table. The items updated are:
        1. PK and UK constraints

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        tab_con_status    specifies the requested status of the PK or UK  constraint that will be created through the DDL.
                            0 --> check con will be enabled and validated 
                            1 --> check con will be enabled but novalidate
                            2 --> check con will be disabled
                            
*/
procedure genupdDBscriptFromTabCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,tab_con_status in number
);

/**
scope: generate script (insert as separate lines in output table) with DDL commands in order to update DB
based on the rows of the DIMGR.INTER_TABLE_CONSTRAINTS table. The items updated are:
        1. FK constraints

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        tab_con_status    specifies the requested status of the PK or UK  constraint that will be created through the DDL.
                            0 --> check con will be enabled and validated 
                            1 --> check con will be enabled but novalidate
                            2 --> check con will be disabled                            
*/
procedure genupdDBscriptFromInterTabCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,tab_con_status in number
);


/**
scope: generate script (insert as separate lines in output table) with DI validation test queries
based on the rows of the DIMGR.COLUMNS table. 

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        resowner    schema of the table that will record the results
        restable    name of the table that will record the resutls.
                            
*/
procedure genDIvalscriptFromColumns (
    tblowner in varchar2
    ,tblname in varchar2
    , resowner in varchar2 default 'DIMGR'
    , restable in varchar2 default 'DIRESULTS'
);

/**
scope: generate script (insert as separate lines in output table) with DI validation test queries
based on the rows of the DIMGR.TUPLE_CONSTRAINTS table. 

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        resowner    schema of the table that will record the results
        restable    name of the table that will record the resutls.
                            
*/
procedure genDIvalscriptFromTupCons (
    tblowner in varchar2
    ,tblname in varchar2
    , resowner in varchar2 default 'DIMGR'
    , restable in varchar2 default 'DIRESULTS'
);

/**
scope: generate script (insert as separate lines in output table) with DI validation test queries
based on the rows of the DIMGR.TABLE_CONSTRAINTS table. 

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        resowner    schema of the table that will record the results
        restable    name of the table that will record the resutls.
                            
*/
procedure genDIvalscriptFromTablCons (
    tblowner in varchar2
    ,tblname in varchar2
    , resowner in varchar2 default 'DIMGR'
    , restable in varchar2 default 'DIRESULTS'
);

/**
scope: generate script (insert as separate lines in output table) with DI validation test queries
based on the rows of the DIMGR.INTER_TABLE_CONSTRAINTS table. 

@param  owner in  owner of the table to be updated
        table_name  name of the table to be updated
        resowner    schema of the table that will record the results
        restable    name of the table that will record the resutls.
                            
*/
procedure genDIvalscriptFromIntTablCons (
    tblowner in varchar2
    ,tblname in varchar2
    , resowner in varchar2 default 'DIMGR'
    , restable in varchar2 default 'DIRESULTS'
);


/**
    Scope: gets the current status for the null constraint for a specific column
    
    return: 'Y' if columns is nullable, 'N' if it is not
*/
function get_nullable_status (
    tblowner in varchar2
    ,tblname in varchar2
    ,colname in varchar2
) return varchar2;    

/**
    Scope: drop existing check constraints fro the specified column
    
*/
procedure drop_existing_check_cons(
    tblowner in varchar2
    ,tblname in varchar2
    ,colname in varchar2 default null
);


/**
    Scope: drop existing check constraints fro the specified column
    It does NOT perform the drop, instead it returns the result through
    a table function in the from of DDL commands with the drop constraint commands
    
    if colname is null then drop all check constraints of the specified table  
*/
function drop_existing_check_cons_tfunc(
    tblowner in varchar2
    ,tblname in varchar2
    ,colname in varchar2 default null
) return output_table_typ PIPELINED;


/**
    Scope: drop existing PK/UK constraints for the specified table
    It does NOT perform the drop, instead it returns the result through
    a table function in the from of DDL commands with the drop constraint commands
      
*/
function drop_existing_pkuk_cons_tfunc(
    tblowner in varchar2
    ,tblname in varchar2
) return output_table_typ PIPELINED;

/**
    Scope: drop existing FK constraints for the specified table
    It does NOT perform the drop, instead it returns the result through
    a table function in the from of DDL commands with the drop constraint commands
      
*/
function drop_existing_fk_cons_tfunc(
    tblowner in varchar2
    ,tblname in varchar2
) return output_table_typ PIPELINED;


/**
    scope return the ddl to create the result table for DI validation scripts
*/
function create_result_table_stmnt(
    tblowner in varchar2
    ,tblname in varchar2
) return varchar2;

/**
    scope  create the result table for DI validation scripts
*/
procedure create_result_table(
    tblowner in varchar2
    ,tblname in varchar2
);



/**
    scope: return in a string the columns of the DI validation result tables. Columns are ordered bu column_id
*/
function get_result_table_columns(
    tblowner in varchar2
    ,tblname in varchar2
) return varchar2;


end DIMGR_PKG ;
/
--
-- DIMGR_PKG  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIMGR.DIMGR_PKG  AS


procedure import_table_from_db(
    tblowner   in  varchar2
    ,name   in  varchar2    
     ,overwrite in varchar2
) is
begin

    -- 1. merge into tables   
    merge into DIMGR.TABLES trg
    using(
        select t.owner, t.table_name, s.comments
        from all_tables t join all_tab_comments s on(t.owner = s.owner and t.table_name = s.table_name)
        where  t.OWNER = tblowner and t.TABLE_NAME = name
    ) src
    on  (trg.owner = src.owner and trg.table_name = src.table_name)
    WHEN MATCHED THEN
    update
        -- overwrite table comments, only if it is checked on the corresponding checkbox
        set trg.table_comment = case when instr(overwrite, '0') > 0 then  src.comments ELSE trg.table_comment END
    WHEN NOT MATCHED THEN 
    INSERT ( trg.OWNER, trg.TABLE_NAME, trg.TABLE_COMMENT )
        values (SRC.owner, src.table_name, src.comments);            
           
    -- 2. merge into columns
        
    -- first save locally check constraints (this is done in order to be able to convert
    -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
    -- are not allowed in wHERE clauses) - since we want to filter out not null check constraints
    
    /*execute immediate 'create table dimgr.srch_cond(
                                owner varchar2(30)
                                , table_name varchar2(30)
                                , column_name varchar2(30)
                                , search_condition clob)';*/

    execute immediate 'truncate table dimgr.srch_cond';
                                     
    execute immediate
    --dbms_output.put_line(
     'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
        select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
        from all_constraints a, all_cons_columns b
        where  
            a.OWNER = b.OWNER and a.table_name = b.table_name and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
            and a.OWNER = '''||tblowner||''''||' and CONSTRAINT_TYPE = ''C''';
            --);
    commit;
    
    -- note: since COLUMNS is at a column level in the using query we need to aggregate data to the column-level
    -- from the individual constraint level which is the level stored in Oracle catalog. 
    merge into DIMGR.COLUMNS trg
    using(
        select  t.owner
                , t.table_name
                , t.COLUMN_NAME
                , t.COLUMN_ID
                , t.DATA_TYPE
                , t.DATA_LENGTH
                , t.DATA_PRECISION
                , t.DATA_SCALE
                , t.NULLABLE
                , s.comments
                , replace(wmsys.wm_concat(c.search_condition), ',', ' AND ')as search_condition -- string aggregation via undocumented  wm_concat, see: http://www.oracle-base.com/articles/misc/StringAggregationTechniques.php
                , replace(wmsys.wm_concat(c.constraint_name), ',', '_') as constraint_name    
        from all_tab_columns t 
                join all_col_comments s on(t.owner = s.owner and t.table_name = s.table_name and t.column_name = s.column_name)
                    left outer join (select * from dimgr.srch_cond where search_condition not like '%IS NOT NULL%') c -- filter out not null constraints                      
                        on( c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name)
        where   t.OWNER = tblowner and t.TABLE_NAME = name
        group by  t.owner
                , t.table_name
                , t.COLUMN_NAME
                , t.COLUMN_ID
                , t.DATA_TYPE
                , t.DATA_LENGTH
                , t.DATA_PRECISION
                , t.DATA_SCALE
                , t.NULLABLE
                , s.comments        
    /*
        select t.owner, t.table_name, t.COLUMN_NAME, t.COLUMN_ID, t.DATA_TYPE, t.DATA_LENGTH, t.DATA_PRECISION, t.DATA_SCALE, t.NULLABLE, s.comments, c.search_condition, c.constraint_name
        from all_tab_columns t 
                join all_col_comments s on(t.owner = s.owner and t.table_name = s.table_name and t.column_name = s.column_name)
                    left outer join (select * from dimgr.srch_cond where search_condition not like '%IS NOT NULL%') c -- filter out not null constraints                      
                        on( c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name)
                    --join all_cons_columns c on (c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name)
                    --    join all_constraints d on (d.OWNER = c.OWNER and d.CONSTRAINT_NAME = c.CONSTRAINT_NAME)
                    --,(select * from dimgr.srch_cond where search_condition not like '%IS NOT NULL%') c 
        where   t.OWNER = tblowner and t.TABLE_NAME = name 
        --and c.owner = t.owner and c.TABLE_NAME = t.table_name and c.column_name = t.column_name
    */
    ) src
    on (trg.owner = src.owner and trg.table_name = src.table_name and trg.column_name = src.column_name)
    WHEN MATCHED THEN
    update
        SET    COLUMN_ID                  = src.COLUMN_ID,
               DATA_TYPE                  = src.DATA_TYPE,
               DATA_LENGTH                = src.DATA_LENGTH,
               DATA_PRECISION             = src.DATA_PRECISION,
               DATA_SCALE                 = src.DATA_SCALE,
               --COLUMN_DESC                = src.COLUMN_DESC,
               COLUMN_COMMENT             =  case when instr(overwrite, '1') > 0 then  src.comments ELSE trg.COLUMN_COMMENT END,
               NULLABLE                   = src.NULLABLE,
               --CONSTRAINT_DESC            = src.CONSTRAINT_DESC,
               CONSTRAINT_CHECK_CONDITION = case when instr(overwrite, '2') > 0 then to_clob(src.search_condition) ELSE to_clob(trg.CONSTRAINT_CHECK_CONDITION) END,
               --case when instr(overwrite, '2') > 0 then src.search_condition ELSE trg.CONSTRAINT_CHECK_CONDITION END,
               --CONSTRAINT_VALIDATION_QRY  = src.CONSTRAINT_VALIDATION_QRY,
               CONSTRAINT_NAME            = src.CONSTRAINT_NAME                          
    WHEN NOT MATCHED THEN 
    INSERT  (
       OWNER, TABLE_NAME, COLUMN_ID, 
       COLUMN_NAME, DATA_TYPE, DATA_LENGTH, 
       DATA_PRECISION, DATA_SCALE,  
       COLUMN_COMMENT, NULLABLE, CONSTRAINT_CHECK_CONDITION, CONSTRAINT_NAME) 
    VALUES ( 
        src.owner, src.table_name,  src.COLUMN_ID, src.COLUMN_NAME, src.DATA_TYPE, src.DATA_LENGTH, src.DATA_PRECISION, 
        src.DATA_SCALE, src.comments, src.NULLABLE, src.search_condition, src.constraint_name 
    );
    
    /*-- clean out table
    execute immediate 'drop table dimgr.srch_cond purge';*/
    
    -- 3. merge into tuples
    merge into DIMGR.TUPLES trg
    using (
        select t.owner, t.table_name
        from all_tables t 
        where  t.OWNER = tblowner and t.TABLE_NAME = name    
    ) src
    on (trg.owner = src.owner and trg.table_name = src.table_name)
    WHEN NOT MATCHED THEN
        insert (OWNER, TABLE_NAME) 
        values (src.owner, src.table_name);          
    
    -- merge into tuple_constraints
    merge into dimgr.tuple_constraints trg
    using (
        -- I use the row_number in order to get only the first row for each constraint, in the case that
        -- the same constraint appears multiple times for each column participating in the constraint.
        -- Note that a group by is not possible in this case, because search_condition is a clob and you cannot
        -- group by on a clob field.
        select owner, table_name, constraint_name, search_condition
        from (       
                select owner, table_name, constraint_name, search_condition, row_number() over(partition by constraint_name order by column_name) r 
                from dimgr.srch_cond
                where search_condition not like '%IS NOT NULL%'
                and table_name = name
              )
        where r = 1      
    ) src
    on(trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name)
    WHEN MATCHED THEN
        update
            set CONSTRAINT_CHECK_CONDITION = src.search_condition
    WHEN NOT MATCHED THEN 
        insert (OWNER, TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_DESC, CONSTRAINT_CHECK_CONDITION, CONSTRAINT_VALIDATION_QRY)
        values (src.owner,src.table_name, src.constraint_name,null,src.search_condition,null);
    
    -- merge into tuple_constraints_ref_columns 
    merge into dimgr.tuple_constraints_ref_columns trg
    using (
                select owner, table_name, constraint_name, column_name, search_condition 
                from dimgr.srch_cond
                where search_condition not like '%IS NOT NULL%'
                and table_name = name
    ) src
    on(trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and trg.column_name = src.column_name)
    WHEN NOT MATCHED THEN 
        insert (OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME)
        values (src.owner,src.table_name, src.constraint_name,src.column_name);

    -- merge into table_constraints
    merge into DIMGR.TABLE_CONSTRAINTS trg
    using (
        select owner, table_name, constraint_name , constraint_type as type
        from all_constraints a
        where  
        a.OWNER = tblowner  and table_name = name and  CONSTRAINT_TYPE in ('P', 'U')    
    ) src
    on (trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name)
    WHEN MATCHED THEN
    update 
        set TRG.TYPE = src.type
     WHEN NOT MATCHED THEN
        insert( trg.OWNER, trg.TABLE_NAME, trg.CONSTRAINT_NAME, trg.TYPE)
            values(src.owner, src.table_name, src.constraint_name , src.type);

   -- merge into table_constraints_ref_column
   merge into DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS trg
   using (
        select a.owner, a.table_name, a.constraint_name , a.constraint_type, B.COLUMN_NAME, position
        from all_constraints a, all_cons_columns b
        where  
             a.OWNER = b.OWNER and a.table_name = b.table_name and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
             and  a.OWNER = tblowner  and a.table_name = name and  a.CONSTRAINT_TYPE in ('P', 'U')   
   ) src
   on(trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and trg.column_name = src.column_name)
  WHEN MATCHED THEN
  update 
    set trg.position = src.position
  WHEN NOT MATCHED THEN
    insert( trg.OWNER, trg.TABLE_NAME, trg.CONSTRAINT_NAME, trg.COLUMN_NAME, trg.position)
    values (src.OWNER, src.TABLE_NAME, src.CONSTRAINT_NAME, src.COLUMN_NAME, src.position);
    
    -- merge into inter_table_constraints
    merge into dimgr.inter_table_constraints trg
    using (
        select 
            a.owner
            , a.table_name 
            ,a.constraint_name 
            ,  A.CONSTRAINT_TYPE as type 
            , a.R_OWNER as refowner
            , (select table_name from all_constraints b where b.constraint_name = a.r_constraint_name) as reftable
            , a.R_CONSTRAINT_NAME  as refconname       
        from all_constraints a
        where  
              a.OWNER = tblowner  and a.table_name = name and  a.constraint_type in ('R')        
    ) src
    on(TRG.OWNER = src.owner and TRG.TABLE_NAME = src.table_name and TRG.CONSTRAINT_NAME = src.constraint_name)
    WHEN MATCHED THEN
    update
       set TRG.TYPE = src.type ,
            TRG.REF_PKOWNER= src.refowner,
            TRG.REF_PKTABLE_NAME = src.reftable,
            TRG.REF_PKCONSTRAINT_NAME = src.refconname          
  WHEN NOT MATCHED THEN
    insert (trg.OWNER, trg.TABLE_NAME, trg.CONSTRAINT_NAME, TRG.TYPE, TRG.REF_PKOWNER, TRG.REF_PKTABLE_NAME, TRG.REF_PKCONSTRAINT_NAME)
    values (src.owner, src.table_name, src.constraint_name, src.type, src.refowner, src.reftable, src.refconname);
    
    -- merge into itable_constraints_ref_columns
    merge into dimgr.itable_constraints_ref_columns trg
    using (
        select a.owner, a.table_name, a.constraint_name , B.COLUMN_NAME,  position
        from all_constraints a, all_cons_columns b
        where  
             a.OWNER = b.OWNER and a.table_name = b.table_name and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
             and  a.OWNER = tblowner  and a.table_name = name and  a.CONSTRAINT_TYPE in ('R')       
    ) src
    on(trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and trg.column_name = src.column_name)
    WHEN MATCHED THEN
         update 
        set trg.position = src.position
    WHEN NOT MATCHED THEN 
        insert (OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, trg.position)
        values (src.owner,src.table_name, src.constraint_name,src.column_name, src.position);
   
    -- merge into inter_table_cons_ref_tables 
merge into dimgr.inter_table_cons_ref_tables trg
        using (
            select 
                a.owner
                , a.table_name 
                ,a.constraint_name 
                ,  A.CONSTRAINT_TYPE as type 
                , a.R_OWNER as refowner
                , (select table_name from all_constraints b where b.constraint_name = a.r_constraint_name) as reftable
                --, a.R_CONSTRAINT_NAME  as refconname       
            from all_constraints a
            where  
                  a.OWNER = tblowner  and a.table_name = name and  a.constraint_type in ('R')            
        ) src
    on(trg.owner = src.owner and trg.table_name = src.table_name and trg.constraint_name = src.constraint_name and TRG.REF_OWNER = src.refowner and TRG.REF_TABLE_NAME = src.reftable)            
    WHEN NOT MATCHED THEN
        insert( trg.OWNER, trg.TABLE_NAME, trg.CONSTRAINT_NAME, TRG.REF_OWNER, TRG.REF_TABLE_NAME)
        values (src.OWNER, src.TABLE_NAME, src.CONSTRAINT_NAME, src.refowner,   src.reftable);   
    commit;
    
end import_table_from_db;

procedure purge_table_from_repository(
    tblowner   in  varchar2
    ,name   in  varchar2    
) is
begin
    delete from DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
    where owner = tblowner and table_name = name;
    
    delete from DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS
    where owner = tblowner and table_name = name;

    delete from DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS
    where owner = tblowner and table_name = name;

    delete from DIMGR.COLUMNS
    where owner = tblowner and table_name = name;

    delete from DIMGR.TUPLE_CONSTRAINTS
    where owner = tblowner and table_name = name;

    delete from DIMGR.TUPLES
    where owner = tblowner and table_name = name;

    delete from DIMGR.TABLE_CONSTRAINTS
    where owner = tblowner and table_name = name;

    delete from DIMGR.INTER_TABLE_CONS_REF_TABLES
    where owner = tblowner and table_name = name;
        
    delete from DIMGR.INTER_TABLE_CONSTRAINTS
    where owner = tblowner and table_name = name;

    delete from DIMGR.TABLES
    where owner = tblowner and table_name = name;
    
    commit;

end purge_table_from_repository;

procedure update_tab_columns(
  OWNER                       VARCHAR2,
  TABLE_NAME                  VARCHAR2,
  COLUMN_NAME                 VARCHAR2,
  COLUMN_ID                   NUMBER  ,  
  DATA_TYPE                   VARCHAR2,
  DATA_LENGTH                 NUMBER,
  DATA_PRECISION              NUMBER,
  DATA_SCALE                  NUMBER,
  COLUMN_DESC                 VARCHAR2,
  COLUMN_COMMENT              VARCHAR2,
  NULLABLE                    VARCHAR2,
  CONSTRAINT_DESC             VARCHAR2,
  CONSTRAINT_CHECK_CONDITION  CLOB,
  CONSTRAINT_VALIDATION_QRY   CLOB,
  CONSTRAINT_NAME             VARCHAR2
)
is
begin
    update dimgr.columns t
        SET    --COLUMN_ID                  = COLUMN_ID,
               --DATA_TYPE                  = DATA_TYPE,
               --DATA_LENGTH                = DATA_LENGTH,
               --DATA_PRECISION             = DATA_PRECISION,
               --DATA_SCALE                 = DATA_SCALE,
               t.COLUMN_DESC                = COLUMN_DESC,
               t.COLUMN_COMMENT             = COLUMN_COMMENT,
               t.NULLABLE                   = upper(substr(trim(NULLABLE),1,1)),
               t.CONSTRAINT_DESC            = CONSTRAINT_DESC,
               t.CONSTRAINT_CHECK_CONDITION = CONSTRAINT_CHECK_CONDITION,
               t.CONSTRAINT_VALIDATION_QRY  = CONSTRAINT_VALIDATION_QRY,
               t.CONSTRAINT_NAME            = upper(CONSTRAINT_NAME)  
    where
        t.owner = owner
        and t.table_name = table_name
        and t.column_name = column_name;
     
    commit;
end update_tab_columns;

procedure testhtml
is 
begin
    htp.p('lalallalalalalalla ');
end testhtml;


procedure genHTMLupdDBscriptFromColumns(
    tblowner in varchar2
    ,tblname in varchar2
)
is

--v_cols COLUMNS%ROWTYPE;

/*
cursor col_cur is
    select *
    from dimgr.columns
    where owner = tblowner and table_name = tblname;        

v_cols col_cur%ROWTYPE;

*/
begin
/*open col_cur;
LOOP
    FETCH col_cur INTO v_cols; 
    
    htp.p (
        'COMMENT ON COLUMN '||col_cur.owner||'.'||col_cur.table_name||'.'||col_cur.column_name||'  IS '''||col_cur.COLUMN_COMMENT||''';'      
    );
    
    EXIT WHEN col_cur%NOTFOUND;
END LOOP;
close col_cur;
*/

for col_cur in ( select *
    from dimgr.columns
    where owner = tblowner and table_name = tblname ) loop

    htp.p (
        'COMMENT ON COLUMN '||col_cur.owner||'.'||col_cur.table_name||'.'||col_cur.column_name||'  IS '''||col_cur.COLUMN_COMMENT||''';'      
    );
    
end loop;    

end genHTMLupdDBscriptFromColumns;

procedure genupdDBscriptFromColumns (
    tblowner in varchar2
    ,tblname in varchar2
    ,null_con_status in number
    ,check_con_status in number
)
is
current_nullable varchar2(1); -- current status of nullable attribute for a columm
begin
    -- truncate output table
    execute immediate 'truncate table dimgr.output';

    -- ddl for column comments
    insert into dimgr.output(text) values ('--------------- DDL for Column Comments');
     
    for col_cur in ( select * from dimgr.columns where owner = tblowner and table_name = tblname ) loop
        if (col_cur.COLUMN_COMMENT IS NOT NULL) then
            insert into dimgr.output(text)
                values (
                    'COMMENT ON COLUMN '||col_cur.owner||'.'||col_cur.table_name||'.'||col_cur.column_name||'  IS '''||col_cur.COLUMN_COMMENT||''';'        
                );
        end if;
    end loop;
               
    -- ddl for nulls
    insert into dimgr.output(text) values ('--------------- DDL for NULLS');
    for col_cur in ( select * from dimgr.columns where owner = tblowner and table_name = tblname ) loop
    
        -- check if current null constraint in DB differs from the one recorded in COLUMNS.nullable field
        current_nullable := get_nullable_status(col_cur.owner, col_cur.table_name, col_cur.column_name);
        /*
        select nullable into current_nullable
        from all_tab_columns
        where owner = col_cur.owner and table_name = col_cur.table_name and column_name =  col_cur.column_name;
        */
        -- produce DDL only if the null status changes
        if(current_nullable <> col_cur.nullable) then 
            
            if(null_con_status = 0) then --validate not null
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' modify '||col_cur.column_name||
                            decode(col_cur.nullable,'Y',' NULL;','N',' NOT NULL;')
                    );        
            elsif(null_con_status = 1)  then -- not validate not null constraint
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' modify '||col_cur.column_name||
                            decode(col_cur.nullable,'Y',' NULL;','N',' NOT NULL enable novalidate;')
                    );      
            else -- disable not null
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' modify '||col_cur.column_name||
                            decode(col_cur.nullable,'Y',' NULL;','N',' NOT NULL disable;')
                    );                                         
            end if;
       end if;                    
    end loop;    
    
    -- ddl for check constraints
    insert into dimgr.output(text) values ('--------------- DDL for COLUMN CHECK CONSTRAINTS');
    for col_cur in ( select * from dimgr.columns where owner = tblowner and table_name = tblname 
                    and CONSTRAINT_CHECK_CONDITION is not null ) loop
        
    -- ddl for dropping any existing check constraints and replace with new one
        insert into dimgr.output
            select * from table(drop_existing_check_cons_tfunc(col_cur.owner, col_cur.table_name, col_cur.column_name ) );
        -- drop any existing check constraints and replace with new one
        --drop_existing_check_cons(col_cur.owner, col_cur.table_name, col_cur.column_name );
        
        if(check_con_status = 0) then --validate
            -- if there is a constraint_name, then include it in the ddl command
            if(col_cur.constraint_name is not null) then
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' add constraint '||col_cur.constraint_name
                            ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||');'
                    );             
            else--else omit the constraint name
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' modify '||col_cur.column_name
                            ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||');'
                    ); 
            end if;                   
        elsif (check_con_status = 1) then -- enable novalidate
            -- if there is a constraint_name, then include it in the ddl command
            if(col_cur.constraint_name is not null) then
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' add constraint '||col_cur.constraint_name
                            ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||') enable novalidate;'
                    );             
            else -- else omit the constraint name       
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' modify '||col_cur.column_name
                            ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||') enable novalidate;'
                    ); 
            end if;                           
        else -- disable
            -- if there is a constraint_name, then include it in the ddl command
            if(col_cur.constraint_name is not null) then
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' add constraint '||col_cur.constraint_name
                            ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||')  disable;'
                    );             
            else -- else omit the constraint name               
                insert into dimgr.output(text)
                    values (
                        'alter table '||col_cur.owner||'.'||col_cur.table_name||' modify '||col_cur.column_name
                            ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||') disable;'
                    );     
            end if;                               
        end if; 
    end loop;    
    commit;        
end genupdDBscriptFromColumns; 

procedure genupdDBscriptFromTupCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,check_con_status in number
) IS
begin
    -- truncate output table
    execute immediate 'truncate table dimgr.output';


    -- ddl for check constraints
    insert into dimgr.output(text) values ('--------------- DDL for TUPLE CHECK CONSTRAINTS');

    -- ddl for dropping any existing check constraints and replace with new one
    insert into dimgr.output
        select * from table(drop_existing_check_cons_tfunc(tblowner, tblname ) );
    -- ddl for new constraints        
    for col_cur in ( select * from dimgr.tuple_constraints where owner = tblowner and table_name = tblname 
                    and CONSTRAINT_CHECK_CONDITION is not null ) loop
        
        
        if(check_con_status = 0) then --validate

            insert into dimgr.output(text)
                values (
                    'alter table '||col_cur.owner||'.'||col_cur.table_name||' add constraint '||col_cur.constraint_name
                        ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||');'
                );             
        elsif (check_con_status = 1) then -- enable novalidate
            insert into dimgr.output(text)
                values (
                    'alter table '||col_cur.owner||'.'||col_cur.table_name||' add constraint '||col_cur.constraint_name
                        ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||') enable novalidate;'
                );             
        else -- disable
            insert into dimgr.output(text)
                values (
                    'alter table '||col_cur.owner||'.'||col_cur.table_name||' add constraint '||col_cur.constraint_name
                        ||' CHECK('||col_cur.CONSTRAINT_CHECK_CONDITION ||')  disable;'
                );             
        end if; 
    end loop;    
    commit;        
    
end genupdDBscriptFromTupCons; 

procedure genupdDBscriptFromTabCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,tab_con_status in number
) IS
--is_found   integer;
begin
    -- truncate output table
     execute immediate 'truncate table dimgr.output';

    -- ddl for PK/UK constraints
    insert into dimgr.output(text) values ('--------------- DDL for PK/UK CONSTRAINTS');

    -- ddl for dropping any existing check constraints and replace with new one
    insert into dimgr.output
        select * from table(drop_existing_pkuk_cons_tfunc(tblowner, tblname ) );
    
    -- ddl for new constraints        
    for col_cur in ( select * from dimgr.table_constraints where owner = tblowner and table_name = tblname 
                    and type in ('P', 'U')) loop
                    /*-- check if constraint already exists
                    select count(*) into is_found      
                    from all_constraints
                    where  owner = tblowner and table_name = tblname AND CONSTRAINT_NAME = col_cur.CONSTRAINT_NAME;     
                    */
                    -- if validate
                    if(tab_con_status = 0) then --validate
                      /*  -- if constraint exists then just modify
                        if (is_found > 0) then
                      
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' modify constraint '||col_cur.constraint_name ||' enable validate;'
                                );
                        -- if constraint does not exist then create
                        else
                       */
                            --alter table lala add constraint lalapk primary key(y)
                            --alter table lala add constraint lalaluk unique (xxx)
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' add constraint '||col_cur.constraint_name ||decode(col_cur.type, 'P', ' primary key',' unique')||'('||(select wmsys.wm_concat(column_name) from (select *from table_constraints_ref_columns where owner = col_cur.owner and TABLE_NAME = col_cur.table_name  AND constraint_name = col_cur.constraint_name order by owner, table_name, constraint_name, position asc))||');'
                                );    
                        --end if;                        
                    -- if enable novalidate
                    elsif (tab_con_status = 1) then -- enable novalidate
                       /* -- if constraint exists then just modify
                        if (is_found > 0) then
                                    insert into dimgr.output(text)
                                        values (
                                            'alter table '||tblowner||'.'||tblname||' modify constraint '||col_cur.constraint_name ||' enable novalidate;'
                                        );
                        -- if constraint does not exist then create
                        else
                        */
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' add constraint '||col_cur.constraint_name ||decode(col_cur.type, 'P', ' primary key',' unique')||'('||(select wmsys.wm_concat(column_name) from (select *from table_constraints_ref_columns where owner = col_cur.owner and TABLE_NAME = col_cur.table_name  AND constraint_name = col_cur.constraint_name order by owner, table_name, constraint_name, position asc))||') ENABLE NOVALIDATE;'
                                );    
                        --end if;                    
                    -- if disable
                    else -- disable
                        /*-- if constraint exists then just modify
                        if (is_found > 0) then
                                    insert into dimgr.output(text)
                                        values (
                                            'alter table '||tblowner||'.'||tblname||' modify constraint '||col_cur.constraint_name ||' disable;'
                                        );
                        -- if constraint does not exist then create
                        else
                        */
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' add constraint '||col_cur.constraint_name ||decode(col_cur.type, 'P', ' primary key',' unique')||'('||(select wmsys.wm_concat(column_name) from (select *from table_constraints_ref_columns where owner = col_cur.owner and TABLE_NAME = col_cur.table_name  AND constraint_name = col_cur.constraint_name order by owner, table_name, constraint_name, position asc))||') DISABLE;'
                                );    
                        --end if;
                    end if;
            /*
            select *
            from dba_constraints
            where table_name = 'LALA'

            desc lala

            alter table lala add constraint lalapk primary key(y)

            alter table lala add constraint lalapk2 primary key(y)

            alter table lala add constraint lalaluk unique (xxx)

            alter table lala add constraint lalaluk2 unique (y, xxx)
            */                                
    end loop;    
    commit;
end genupdDBscriptFromTabCons;


procedure genupdDBscriptFromInterTabCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,tab_con_status in number
) IS
begin
    -- truncate output table
     execute immediate 'truncate table dimgr.output';

    -- ddl for PK/UK constraints
    insert into dimgr.output(text) values ('--------------- DDL for FK CONSTRAINTS');

    -- ddl for dropping any existing check constraints and replace with new one
    insert into dimgr.output
        select * from table(drop_existing_fk_cons_tfunc(tblowner, tblname ) );
    
    -- ddl for new constraints        
    for col_cur in ( select * from dimgr.inter_table_constraints where owner = tblowner and table_name = tblname 
                    and type in ('R')) loop
                    -- if validate
                    if(tab_con_status = 0) then --validate
                    -- alter table dimgr.lala add constraint lalafk foreign key(Z) references dimgr.lala2(x) enable novalidate
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' add constraint '||col_cur.constraint_name ||' foreign key'||'('||(select wmsys.wm_concat(column_name) from (select * from itable_constraints_ref_columns where owner = col_cur.owner and TABLE_NAME = col_cur.table_name  AND constraint_name = col_cur.constraint_name order by owner, table_name, constraint_name, position asc))||')'
                                        ||'references '||col_cur.ref_pkowner||'.'||col_cur.ref_pktable_name||'('||(select wmsys.wm_concat(column_name) from (select * from table_constraints_ref_columns where owner = col_cur.ref_pkowner and TABLE_NAME = col_cur.ref_pktable_name  AND constraint_name = col_cur.ref_pkconstraint_name order by owner, table_name, constraint_name, position asc)) ||')'||';'
                                );    
                    -- if enable novalidate
                    elsif (tab_con_status = 1) then -- enable novalidate
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' add constraint '||col_cur.constraint_name ||' foreign key'||'('||(select wmsys.wm_concat(column_name) from (select * from itable_constraints_ref_columns where owner = col_cur.owner and TABLE_NAME = col_cur.table_name  AND constraint_name = col_cur.constraint_name order by owner, table_name, constraint_name, position asc))||')'
                                    ||'references '||col_cur.ref_pkowner||'.'||col_cur.ref_pktable_name||'('||(select wmsys.wm_concat(column_name) from (select * from table_constraints_ref_columns where owner = col_cur.ref_pkowner and TABLE_NAME = col_cur.ref_pktable_name  AND constraint_name = col_cur.ref_pkconstraint_name order by owner, table_name, constraint_name, position asc)) ||')'|| ' ENABLE NOVALIDATE;'
                                );                        
                    -- if disable
                    else -- disable
                            insert into dimgr.output(text)
                                values (
                                    'alter table '||tblowner||'.'||tblname||' add constraint '||col_cur.constraint_name ||' foreign key'||'('||(select wmsys.wm_concat(column_name) from (select * from itable_constraints_ref_columns where owner = col_cur.owner and TABLE_NAME = col_cur.table_name  AND constraint_name = col_cur.constraint_name order by owner, table_name, constraint_name, position asc))||')'
                                    ||'references '||col_cur.ref_pkowner||'.'||col_cur.ref_pktable_name||'('||(select wmsys.wm_concat(column_name) from (select * from table_constraints_ref_columns where owner = col_cur.ref_pkowner and TABLE_NAME = col_cur.ref_pktable_name  AND constraint_name = col_cur.ref_pkconstraint_name order by owner, table_name, constraint_name, position asc)) ||')'||'  DISABLE;'
                                );    
                    end if;
    end loop;    
    commit;
end genupdDBscriptFromInterTabCons;


procedure genDIvalscriptFromColumns (
    tblowner in varchar2
    ,tblname in varchar2
    ,resowner in varchar2 default 'DIMGR'
    ,restable in varchar2 default 'DIRESULTS'
) IS
testid number;
found_restable number;
begin
    -- truncate output table
    execute immediate 'truncate table dimgr.output';

    -- header
    insert into dimgr.output(text) values ('--- Data Integrity Validation Scripts ---');

    -- check for result table
    select count(*) into found_restable
    from all_tables
    where owner = resowner and table_name = restable;
        
    if (found_restable = 0) then
        -- create  result table
        create_result_table(resowner, restable);
        -- create result table ddl
        /*
        insert into dimgr.output(text) values (
            create_result_table_stmnt(resowner, restable)
        );*/ 
    end if;
       
    -- loop for all validation queries
    testid := 1;
    for rec in (
            select * from dimgr.columns 
            where owner = tblowner and table_name = tblname 
                   and CONSTRAINT_VALIDATION_QRY is not null        
    ) loop
    
        insert into dimgr.output(text) values (
            'insert into '||resowner||'.'||restable
                ||'('
                ||get_result_table_columns(resowner,restable)
                ||')'
                ||' values ('
                ||testid||', '
                ||''''||rec.owner||''','
                ||''''||rec.table_name||''', '
                ||''''||rec.column_name||''', '
                ||nvl2(rec.constraint_name,''''||rec.constraint_name||'''','NULL')||', '
                ||'('||rec.CONSTRAINT_VALIDATION_QRY||'), '
                ||'sysdate'
                ||');'
                
        );      
        
        insert into dimgr.output(text) values ('commit;');  
        
        testid := testid + 1;
    end loop;

    commit;    
end genDIvalscriptFromColumns; 

procedure genDIvalscriptFromTupCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,resowner in varchar2 default 'DIMGR'
    ,restable in varchar2 default 'DIRESULTS'
) IS
testid number;
found_restable number;
begin
    -- truncate output table
    execute immediate 'truncate table dimgr.output';

    -- header
    insert into dimgr.output(text) values ('--- Data Integrity Validation Scripts ---');

    -- check for result table
    select count(*) into found_restable
    from all_tables
    where owner = resowner and table_name = restable;
        
    if (found_restable = 0) then
        -- create  result table
        create_result_table(resowner, restable);
        -- create result table ddl
        /*
        insert into dimgr.output(text) values (
            create_result_table_stmnt(resowner, restable)
        );*/ 
    end if;
       
    -- loop for all validation queries
    testid := 1;
    for rec in (
            select * from dimgr.tuple_constraints 
            where owner = tblowner and table_name = tblname 
                   and CONSTRAINT_VALIDATION_QRY is not null        
    ) loop
    
        insert into dimgr.output(text) values (
            'insert into '||resowner||'.'||restable
                ||'('
                ||get_result_table_columns(resowner,restable)
                ||')'
                ||' values ('
                ||testid||', '
                ||''''||rec.owner||''','
                ||''''||rec.table_name||''', '
                ||'null, '
                ||nvl2(rec.constraint_name,''''||rec.constraint_name||'''','NULL')||', '
                ||'('||rec.CONSTRAINT_VALIDATION_QRY||'), '
                ||'sysdate'
                ||');'
                
        );      
        
        insert into dimgr.output(text) values ('commit;');  
        
        testid := testid + 1;
    end loop;

    commit;    
end genDIvalscriptFromTupCons; 


procedure genDIvalscriptFromTablCons (
    tblowner in varchar2
    ,tblname in varchar2
    ,resowner in varchar2 default 'DIMGR'
    ,restable in varchar2 default 'DIRESULTS'
) IS
testid number;
found_restable number;
begin
    -- truncate output table
    execute immediate 'truncate table dimgr.output';

    -- header
    insert into dimgr.output(text) values ('--- Data Integrity Validation Scripts ---');

    -- check for result table
    select count(*) into found_restable
    from all_tables
    where owner = resowner and table_name = restable;
        
    if (found_restable = 0) then
        -- create  result table
        create_result_table(resowner, restable);
        -- create result table ddl
        /*
        insert into dimgr.output(text) values (
            create_result_table_stmnt(resowner, restable)
        );*/ 
    end if;
       
    -- loop for all validation queries
    testid := 1;
    for rec in (
            select * from dimgr.table_constraints 
            where owner = tblowner and table_name = tblname 
                   and CONSTRAINT_VALIDATION_QRY is not null        
    ) loop
    
        insert into dimgr.output(text) values (
            'insert into '||resowner||'.'||restable
                ||'('
                ||get_result_table_columns(resowner,restable)
                ||')'
                ||' values ('
                ||testid||', '
                ||''''||rec.owner||''','
                ||''''||rec.table_name||''', '
                ||'null, '
                ||nvl2(rec.constraint_name,''''||rec.constraint_name||'''','NULL')||', '
                ||'('||rec.CONSTRAINT_VALIDATION_QRY||'), '
                ||'sysdate'
                ||');'
                
        );      
        
        insert into dimgr.output(text) values ('commit;');  
        
        testid := testid + 1;
    end loop;

    commit;    
end genDIvalscriptFromTablCons; 

procedure genDIvalscriptFromIntTablCons (
    tblowner in varchar2
    ,tblname in varchar2
    , resowner in varchar2 default 'DIMGR'
    , restable in varchar2 default 'DIRESULTS'
) IS
testid number;
found_restable number;
begin
    -- truncate output table
    execute immediate 'truncate table dimgr.output';

    -- header
    insert into dimgr.output(text) values ('--- Data Integrity Validation Scripts ---');

    -- check for result table
    select count(*) into found_restable
    from all_tables
    where owner = resowner and table_name = restable;
        
    if (found_restable = 0) then
        -- create  result table
        create_result_table(resowner, restable);
    end if;
       
    -- loop for all validation queries
    testid := 1;
    for rec in (
            select * from dimgr.inter_table_constraints 
            where owner = tblowner and table_name = tblname 
                   and CONSTRAINT_VALIDATION_QRY is not null        
    ) loop
    
        insert into dimgr.output(text) values (
            'insert into '||resowner||'.'||restable
                ||'('
                ||get_result_table_columns(resowner,restable)
                ||')'
                ||' values ('
                ||testid||', '
                ||''''||rec.owner||''','
                ||''''||rec.table_name||''', '
                ||'null, '
                ||nvl2(rec.constraint_name,''''||rec.constraint_name||'''','NULL')||', '
                ||'('||rec.CONSTRAINT_VALIDATION_QRY||'), '
                ||'sysdate'
                ||');'
                
        );      
        
        insert into dimgr.output(text) values ('commit;');  
        
        testid := testid + 1;
    end loop;

    commit;    

end genDIvalscriptFromIntTablCons;


function create_result_table_stmnt(
    tblowner in varchar2
    ,tblname in varchar2
) return varchar2
is
ret varchar2(4000);
begin
    ret :=  'create table '||tblowner||'.'||tblname||'(
            test_id  number(10),
            owner varchar2(30),
            table_name varchar2(30),
            column_name varchar2(30),
            constraint_name varchar2(500),
            result  number(12),
            population_date date);';

    return ret;
end create_result_table_stmnt;

procedure create_result_table(
    tblowner in varchar2
    ,tblname in varchar2
) 
is
begin
    execute immediate  'create table '||tblowner||'.'||tblname||'(
            test_id  number(10),
            owner varchar2(30),
            table_name varchar2(30),
            column_name varchar2(30),
            constraint_name varchar2(500),
            result  number(12),
            population_date date)';
end create_result_table;

function get_result_table_columns(
    tblowner in varchar2
    ,tblname in varchar2
) return varchar2
is
res varchar2(4000);
begin
    
   select wmsys.wm_concat(column_name) into res
   from all_tab_columns
   where owner = tblowner and table_name = tblname   
   order by column_id;
   
   return res;
   
end get_result_table_columns;

function get_nullable_status (
    tblowner in varchar2
    ,tblname in varchar2
    ,colname in varchar2
) return varchar2    
is
numresult number;
begin

   -- first save locally check constraints (this is done in order to be able to convert
    -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
    -- are not allowed in wHERE clauses) - since we want to filter on not null check constraints
    execute immediate 'truncate table dimgr.srch_cond';
                                     
    execute immediate
    --dbms_output.put_line(
     'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
        select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
        from all_constraints a, all_cons_columns b
        where  
            a.OWNER = b.OWNER and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
            and a.OWNER = '''||tblowner||''''||' and CONSTRAINT_TYPE = ''C''';
            --);
    commit;

    select count(*) into numresult 
    from dimgr.srch_cond
    where  
        owner = tblowner 
        and table_name = tblname
        and column_name = colname
        and search_condition like '%NOT NULL%';

    if(numresult = 1) then
        return 'N';
    else
        return 'Y';
    end if;        
end get_nullable_status;

procedure drop_existing_check_cons(
    tblowner in varchar2
    ,tblname in varchar2
    ,colname in varchar2
)
is
begin
   -- first save locally check constraints (this is done in order to be able to convert
    -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
    -- are not allowed in wHERE clauses) - since we want to filter on check constraints
    execute immediate 'truncate table dimgr.srch_cond';
                                     
    execute immediate
    --dbms_output.put_line(
     'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
        select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
        from all_constraints a, all_cons_columns b
        where  
            a.OWNER = b.OWNER and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
            and a.OWNER = '''||tblowner||''''||' and CONSTRAINT_TYPE = ''C''';
            --);
    commit;

    for rec in (select *   
                from 
                dimgr.srch_cond
                where
                    owner = tblowner 
                    and table_name = tblname
                    and column_name = colname
                    and search_condition not like '%NOT NULL%') loop
                    
        execute immediate 'alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name;
     end loop;
end drop_existing_check_cons; 

function drop_existing_fk_cons_tfunc (
    tblowner in varchar2
    ,tblname in varchar2
)return output_table_typ PIPELINED IS
txt output_typ  := output_typ(NULL);
begin
    for rec in (select *   
                from 
                all_constraints
                where
                    owner = tblowner 
                    and table_name = tblname
                    and constraint_type in ('R')) loop
                        
         --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
         txt.text := 'alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';';
         PIPE ROW(txt);             
     end loop;       
          
    RETURN;
end drop_existing_fk_cons_tfunc;


function drop_existing_pkuk_cons_tfunc (
    tblowner in varchar2
    ,tblname in varchar2
)return output_table_typ PIPELINED IS
txt output_typ  := output_typ(NULL);
begin
    for rec in (select *   
                from 
                all_constraints
                where
                    owner = tblowner 
                    and table_name = tblname
                    and constraint_type in ('P','U')) loop
                        
         --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
         txt.text := 'alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';';
         PIPE ROW(txt);             
     end loop;       
          
    RETURN;
end drop_existing_pkuk_cons_tfunc;

function drop_existing_check_cons_tfunc(
    tblowner in varchar2
    ,tblname in varchar2
    ,colname in varchar2 default NULL
) return output_table_typ PIPELINED IS
txt output_typ  := output_typ(NULL);
PRAGMA AUTONOMOUS_TRANSACTION; -- to avoid ORA-14552: cannot perform a DDL, commit or rollback inside a query or DML 
                               -- since this function will be called in the from clause of a query enclosed in a table function
                               -- and below we perform DDL (truncate)
begin
   -- first save locally check constraints (this is done in order to be able to convert
    -- the search_condition from long to clob and thus be able to restrict it (restrictions on long data types
    -- are not allowed in wHERE clauses) - since we want to filter on check constraints
    execute immediate 'truncate table dimgr.srch_cond';

    if (colname is not null) then                                     
        execute immediate
        --dbms_output.put_line(
         'insert into dimgr.srch_cond(owner, table_name, column_name, search_condition, constraint_name)
            select a.owner, a.table_name, b.column_name, TO_LOB(search_condition), a.constraint_name
            from all_constraints a, all_cons_columns b
            where  
                a.OWNER = b.OWNER and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
                and a.OWNER = '''||tblowner||''''||' and CONSTRAINT_TYPE = ''C''';
                --);
        commit;

        for rec in (select *   
                    from 
                    dimgr.srch_cond
                    where
                        owner = tblowner 
                        and table_name = tblname
                        and column_name = colname
                        and search_condition not like '%NOT NULL%') loop
                    
             --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
             txt.text := 'alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';';
             PIPE ROW(txt);
         
         end loop;   
    else -- colname is null so get the constraints for the whole table
        execute immediate
        --dbms_output.put_line(
         'insert into dimgr.srch_cond(owner, table_name, search_condition, constraint_name)
            select a.owner, a.table_name, TO_LOB(search_condition), a.constraint_name
            from all_constraints a
            where  
                a.OWNER = '''||tblowner||''''||' and CONSTRAINT_TYPE = ''C''';
                --);
        commit;

        for rec in (select *   
                    from 
                    dimgr.srch_cond
                    where
                        owner = tblowner 
                        and table_name = tblname
                        --and column_name = colname
                        and search_condition not like '%NOT NULL%') loop
                    
             --txt := output_typ('alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';');
             txt.text := 'alter table '||rec.owner||'.'||rec.table_name||' drop constraint '||rec.constraint_name||';';
             PIPE ROW(txt);
         
         end loop;   
    
    end if;          
    RETURN;
end drop_existing_check_cons_tfunc;

end DIMGR_PKG;
/
--
-- "Key4"  (Index) 
--
CREATE UNIQUE INDEX DIMGR."Key4" ON DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- "Key5"  (Index) 
--
CREATE UNIQUE INDEX DIMGR."Key5" ON DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS
(CONSTRAINT_NAME, OWNER, TABLE_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- LALAPK  (Index) 
--
CREATE UNIQUE INDEX DIMGR.LALAPK ON DIMGR.LALA
(Y, Z, XXX)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- NEWPK  (Index) 
--
CREATE UNIQUE INDEX DIMGR.NEWPK ON DIMGR.LALA
(XXX)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- NEWUK  (Index) 
--
CREATE UNIQUE INDEX DIMGR.NEWUK ON DIMGR.LALA
(Z, XXX)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF1COLUMNS  (Index) 
--
CREATE INDEX DIMGR.XIF1COLUMNS ON DIMGR.COLUMNS
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF1INTER_TABLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF1INTER_TABLE_CONSTRAINTS ON DIMGR.INTER_TABLE_CONSTRAINTS
(TYPE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF1TABLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF1TABLE_CONSTRAINTS ON DIMGR.TABLE_CONSTRAINTS
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF1TUPLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF1TUPLE_CONSTRAINTS ON DIMGR.TUPLE_CONSTRAINTS
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF1TUPLE_CONSTRAINTS_REF_COLU  (Index) 
--
CREATE INDEX DIMGR.XIF1TUPLE_CONSTRAINTS_REF_COLU ON DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF2TABLE_CONSTRAINTS  (Index) 
--
CREATE INDEX DIMGR.XIF2TABLE_CONSTRAINTS ON DIMGR.TABLE_CONSTRAINTS
(TYPE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XIF2TUPLE_CONSTRAINTS_REF_COLU  (Index) 
--
CREATE INDEX DIMGR.XIF2TUPLE_CONSTRAINTS_REF_COLU ON DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKCOLUMNS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKCOLUMNS ON DIMGR.COLUMNS
(OWNER, TABLE_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKCONSTRAINT_TYPES  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKCONSTRAINT_TYPES ON DIMGR.CONSTRAINT_TYPES
(TYPE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKINTER_TABLE_CONSTRAINTS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKINTER_TABLE_CONSTRAINTS ON DIMGR.INTER_TABLE_CONSTRAINTS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKINTER_TABLE_CONSTRAINTS_REF  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKINTER_TABLE_CONSTRAINTS_REF ON DIMGR.INTER_TABLE_CONS_REF_TABLES
(CONSTRAINT_NAME, OWNER, TABLE_NAME, REF_OWNER, REF_TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKTABLES  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTABLES ON DIMGR.TABLES
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKTABLE_CONSTRAINTS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTABLE_CONSTRAINTS ON DIMGR.TABLE_CONSTRAINTS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKTUPLES  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTUPLES ON DIMGR.TUPLES
(OWNER, TABLE_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKTUPLE_CONSTRAINTS  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTUPLE_CONSTRAINTS ON DIMGR.TUPLE_CONSTRAINTS
(OWNER, TABLE_NAME, CONSTRAINT_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/


--
-- XPKTUPLE_CONSTRAINTS_REF_COLUM  (Index) 
--
CREATE UNIQUE INDEX DIMGR.XPKTUPLE_CONSTRAINTS_REF_COLUM ON DIMGR.TUPLE_CONSTRAINTS_REF_COLUMNS
(OWNER, TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
COMPUTE STATISTICS
ONLINE
/
--
-- OUTPUT_TABLE_TYP  (Type) 
--
CREATE OR REPLACE TYPE DIMGR.output_table_typ as table of output_typ;
/


--
-- OUTPUT_TYP  (Type) 
--
CREATE OR REPLACE TYPE DIMGR.output_typ as object (
    text varchar2(4000)
);
/

