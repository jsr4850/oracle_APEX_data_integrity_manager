/*
Various tuning stuff
*/

alter table DIMGR.CONSTRAINT_TYPES  STORAGE (buffer_pool KEEP);

exec dbms_stats.gather_schema_stats(ownname => 'DIMGR', DEGREE => 8);
