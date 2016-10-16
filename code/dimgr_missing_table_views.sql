/*
    Return tables that have not been imported from the owners that have been imported (meaning at least one table belonging to these owners has been imported)
*/
CREATE OR REPLACE VIEW DIMGR.V_MISSING_TABLES (
    owner,
    table_name
)
AS    
select t1.owner, t1.table_name
from    (
    select owner, table_name
    from all_tables 
    where
        owner in (select owner from dimgr.tables)    
        ) t1 LEFT OUTER JOIN
        dimgr.tables t2 on (t1.owner = t2.owner and t1.table_name = t2.table_name)
where
    t2.table_name IS NULL
order by 1, 2
/    

/*
    Return columns that have not been imported although their tables have
*/
CREATE OR REPLACE VIEW  DIMGR.V_MISSING_COLUMNS (
    owner,
    table_name,
    column_name
)
AS    
select t1.owner, t1.table_name, t1.column_name
from (
    select owner, table_name, column_name
    from all_tab_columns 
    where (owner, table_name) in (select owner, table_name from dimgr.tables)
    ) t1 LEFT OUTER JOIN
    dimgr.columns t2 ON (t1.owner = t2.owner and t1.table_name = t2.table_name and t1.column_name = t2.column_name)
where
    t2.column_name IS NULL   
/      