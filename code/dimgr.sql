drop user DIMGR;
create user DIMGR identified by DIMGR
  --DEFAULT TABLESPACE SCRATCH
  --TEMPORARY TABLESPACE TEMP2
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for DIMGR 
  GRANT CONNECT TO DIMGR;
  ALTER USER DIMGR DEFAULT ROLE ALL;
  -- 14 System Privileges for DIMGR
  GRANT SELECT ANY DICTIONARY to dimgr;
  grant select,insert,update,delete on dwsrc.plan_table to dimgr;
  GRANT CREATE TABLE TO DIMGR;
  GRANT CREATE JOB TO DIMGR;
  GRANT CREATE SEQUENCE TO DIMGR;
  GRANT CREATE TYPE TO DIMGR;
  GRANT CREATE MATERIALIZED VIEW TO DIMGR;
  GRANT CREATE DIMENSION TO DIMGR;
  GRANT CREATE INDEXTYPE TO DIMGR;
  GRANT CREATE OPERATOR TO DIMGR;
  GRANT CREATE VIEW TO DIMGR;
  GRANT CREATE TABLE TO DIMGR;
  GRANT CREATE TRIGGER TO DIMGR;
  GRANT CREATE ANY CONTEXT TO DIMGR;
  GRANT CREATE PROCEDURE TO DIMGR;
  GRANT CREATE SYNONYM TO DIMGR;
  GRANT CREATE CLUSTER TO DIMGR;
  -- 1 Tablespace Quota for DIMGR 
  ALTER USER DIMGR QUOTA UNLIMITED ON SCRATCH;
  ALTER USER DIMGR QUOTA UNLIMITED ON USERS;
  -- 5 Object Privileges for DIMGR 
    GRANT EXECUTE ON  CTXSYS.CTX_DDL TO DIMGR;
    GRANT EXECUTE ON  CTXSYS.CTX_DOC TO DIMGR;
    --GRANT EXECUTE ON  SYS.DBMS_RLS TO DIMGR;