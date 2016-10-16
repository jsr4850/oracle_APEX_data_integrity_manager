
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

/*
    Return all constraints as if they are in a single table
    NOTE: Get also those constraints with a null validation query.
*/
CREATE OR REPLACE VIEW  DIMGR.V_ALL_DICONSTRAINTS (
    owner,
    table_name,
    constraint_name,
    column_name,
    TYPE,
    CONSTRAINT_DESC,
    CONSTRAINT_CHECK_CONDITION,
    CONSTRAINT_VALIDATION_QRY,
    last_updated_by,
    last_updated   
)
AS    
select   t1.owner,
    t1.table_name,
    t1.constraint_name,
    'N/A',
    T2.TYPE_DESC,
    t1.constraint_desc,
    'N/A',
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    t1.last_updated    
FROM  DIMGR.INTER_TABLE_CONSTRAINTS t1 join  DIMGR.CONSTRAINT_TYPES t2 on (T1.TYPE = t2.type)
UNION
select   t1.owner,
    t1.table_name,
    t1.constraint_name,
    'N/A',
    T2.TYPE_DESC,
    t1.constraint_desc,
    'N/A',
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    t1.last_updated        
FROM  DIMGR.TABLE_CONSTRAINTS t1 join  DIMGR.CONSTRAINT_TYPES t2 on (T1.TYPE = t2.type)
UNION
select   t1.owner,
    t1.table_name,
    t1.constraint_name,
    'N/A',
    'tuple constraint',
    t1.constraint_desc,
    dbms_lob.substr( t1.CONSTRAINT_CHECK_CONDITION, 4000, 1 ),
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    last_updated            
FROM  DIMGR.TUPLE_CONSTRAINTS t1 
UNION
select   t1.owner,
    t1.table_name,
    nvl(t1.constraint_name, 'N/A'),
    t1.column_name,
    'column constraint',
    t1.constraint_desc,
    dbms_lob.substr( t1.CONSTRAINT_CHECK_CONDITION, 4000, 1 ),
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    last_updated            
FROM  DIMGR.COLUMNS t1 
/


/*
    Return all constraints as if they are in a single table
    NOTE: Get only those constraints with a not null validation query.
*/
CREATE OR REPLACE VIEW  DIMGR.V_ALL_DICONS_NOTNULL_VALQ (
    owner,
    table_name,
    constraint_name,
    column_name,
    TYPE,
    CONSTRAINT_DESC,
    CONSTRAINT_CHECK_CONDITION,
    CONSTRAINT_VALIDATION_QRY,
    last_updated_by,
    last_updated   
)
AS    
SELECT
   owner,
    table_name,
    constraint_name,
    column_name,
    TYPE,
    CONSTRAINT_DESC,
    CONSTRAINT_CHECK_CONDITION,
    CONSTRAINT_VALIDATION_QRY,
    last_updated_by,
    last_updated   
FROM    DIMGR.V_ALL_DICONSTRAINTS
WHERE  constraint_validation_qry is not NULL;
/

/*
select   t1.owner,
    t1.table_name,
    t1.constraint_name,
    'N/A',
    T2.TYPE_DESC,
    t1.constraint_desc,
    'N/A',
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    t1.last_updated    
FROM  DIMGR.INTER_TABLE_CONSTRAINTS t1 join  DIMGR.CONSTRAINT_TYPES t2 on (T1.TYPE = t2.type)
WHERE t1.constraint_validation_qry IS NOT NULL
UNION
select   t1.owner,
    t1.table_name,
    t1.constraint_name,
    'N/A',
    T2.TYPE_DESC,
    t1.constraint_desc,
    'N/A',
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    t1.last_updated        
FROM  DIMGR.TABLE_CONSTRAINTS t1 join  DIMGR.CONSTRAINT_TYPES t2 on (T1.TYPE = t2.type)
WHERE t1.constraint_validation_qry IS NOT NULL
UNION
select   t1.owner,
    t1.table_name,
    t1.constraint_name,
    'N/A',
    'tuple constraint',
    t1.constraint_desc,
    dbms_lob.substr( t1.CONSTRAINT_CHECK_CONDITION, 4000, 1 ),
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    last_updated            
FROM  DIMGR.TUPLE_CONSTRAINTS t1 
WHERE t1.constraint_validation_qry IS NOT NULL
UNION
select   t1.owner,
    t1.table_name,
    nvl(t1.constraint_name, 'N/A'),
    t1.column_name,
    'column constraint',
    t1.constraint_desc,
    dbms_lob.substr( t1.CONSTRAINT_CHECK_CONDITION, 4000, 1 ),
    dbms_lob.substr( t1.constraint_validation_qry, 4000, 1 ),
    t1.last_updated_by,
    last_updated            
FROM  DIMGR.COLUMNS t1 
WHERE t1.constraint_validation_qry IS NOT NULL
/
*/

/*
    Return all validation queries that fail to be parsed
*/
CREATE OR REPLACE VIEW  DIMGR.V_BAD_QUERIES (
    owner,
    table_name,
    constraint_name,
    column_name,
    type,
    constraint_desc,
    CONSTRAINT_CHECK_CONDITION,
    CONSTRAINT_VALIDATION_QRY,
    last_updated_by,
    last_updated,
    errormsg   
)
AS
select  /*+ parallel(t  16) */   
  owner,
    table_name,
    constraint_name,
    column_name,
    type,
    constraint_desc,
    CONSTRAINT_CHECK_CONDITION,
    CONSTRAINT_VALIDATION_QRY,
    last_updated_by,
    last_updated,
   dimgr.dimgr_pkg.is_valid_sql( CONSTRAINT_VALIDATION_QRY) as errormsg   
from  DIMGR.V_ALL_DICONS_NOTNULL_VALQ t --DIMGR.V_ALL_DICONSTRAINTS t
where dimgr.dimgr_pkg.is_valid_sql( CONSTRAINT_VALIDATION_QRY) <> 'OK';
/
--and  CONSTRAINT_VALIDATION_QRY IS NOT NULL;
/   

/*
    Return all OUTPUT lines ordered
*/
CREATE OR REPLACE VIEW DIMGR.V_OUTPUT (
    TEXT
)     
AS
select text
from dimgr.output
order by lineno

/*
 Get most recent Test Results
*/
CREATE OR REPLACE VIEW DIMGR.V_DIRESULTS_MOST_RECENT (
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                             
                             ,total_cnt_results
)
AS
 select 
                             test_id
                             ,owner
                             ,table_name
                             ,nvl(constraint_name, 'N/A')                             
                             ,nvl(column_name, 'N/A')
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                             
                             ,count(*) over() total_results
                     from (    
                         select
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG
                             ,row_number() over(partition by owner, table_name, constraint_name, column_name, type  order by population_date desc)  r              
                         from  dimgr.diresults
                     ) t
                     where
                         t.r =   1;
/       

/*
    Get All failed results
*/
CREATE OR REPLACE VIEW V_DIRESULTS_ALL_FAILED (
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                
)
AS
select 
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG               
from dimgr.DIRESULTS     
where              
nvl(result, 1) not in (0, -99999);
/              

/*
 Get most recent  failed Test Results
*/
CREATE OR REPLACE VIEW DIMGR.V_DIRESULTS_MOST_RECENT_FAILED (
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                             
                             ,total_cnt_results
)
AS
SELECT 
                              test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,type
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                             
                             ,total_cnt_results
FROM DIMGR.V_DIRESULTS_MOST_RECENT
WHERE nvl(result, 1) not in (0, -99999);                            

/*
 DI RESULTS statistics 
*/
CREATE OR REPLACE VIEW V_DIRESULTS_STATS (
    OWNER,
    TYPE,
    CNT_FAILED_RESULT,
    CNT_RESULTS,
    FAILURE_PCNT,
    TOTAL_CNT_RESULTS
)
AS
SELECT
    OWNER,
    TYPE,
    sum(case when nvl(result,1) <> 0 then 1 else 0  end ) CNT_FAILED_RESULTS,
    count(*) CNT_RESULTS,
    round((sum(case when nvl(result,1) <> 0 then 1 else 0 end ) / count(*)) * 100, 2)  FAILURE_PCNT,
    TOTAL_CNT_RESULTS
FROM  DIMGR.V_DIRESULTS_MOST_RECENT
GROUP BY
    OWNER,
    TYPE,
    TOTAL_CNT_RESULTS;
/

--------------------------------- DRAFT -----------------

select * from V_MOST_RECENT_DIRESULTS 
where constraint_name  like 'N/A'

select last_updated_by, count(*)
from DIMGR.V_BAD_QUERIES
where owner = 'PRESENT_PERIF'
group by last_updated_by

select *
from (
select last_updated_by, count(*) bad_queries
from DIMGR.V_BAD_QUERIES
where owner = 'PRESENT_PERIF'
group by last_updated_by
) t1 join
(
select last_updated_by, count(*) all_queries
from DIMGR.V_ALL_DICONSTRAINTS
where owner = 'PRESENT_PERIF' and CONS_VAL_QUERY is not null
and LAST_UPDATED > to_date('01/02/2011', 'dd/mm/yyyy')
group by last_updated_by
) t2
using (last_updated_by)


select *
from DIMGR.V_BAD_QUERIES
where last_updated_by = 'NKARAG'
 and owner = 'PRESENT_PERIF'

select *
from V_OUTPUT

select *
from dimgr.diresults 
where nvl(result, 1) <> 0

 select 
                             test_id
                             ,owner
                             ,table_name
                             ,column_name
                             ,constraint_name
                             ,result
                             ,population_date
                     from (    
                         select
                             test_id
                             ,owner
                             ,table_name
                             ,column_name
                             ,constraint_name
                             ,result
                             ,population_date
                             ,row_number() over(partition by owner, table_name, column_name, constraint_name  order by population_date desc)  r              
                         from  dimgr.diresults
                     ) t
                     where
                         t.r =   1          

-------------------------------------------------------------- OLD ----------------------------------------

/*
 Get most recent Test Results
*/
/*
CREATE OR REPLACE VIEW DIMGR.V_MOST_RECENT_DIRESULTS (
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                             
                             ,total_cnt_results
)
AS
 select 
                             test_id
                             ,owner
                             ,table_name
                             ,nvl(constraint_name, 'N/A')                             
                             ,nvl(column_name, 'N/A')
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG                             
                             ,count(*) over() total_results
                     from (    
                         select
                             test_id
                             ,owner
                             ,table_name
                             ,constraint_name                             
                             ,column_name
                             ,result
                             ,population_date
                             ,ERROR_CODE
                             ,ERROR_MSG
                             ,row_number() over(partition by owner, table_name, constraint_name, column_name  order by population_date desc)  r              
                         from  dimgr.diresults
                     ) t
                     where
                         t.r =   1;
/                                   
*/
/*
ALL DI RESULTS per type
*/
/*
CREATE OR REPLACE VIEW V_GROUP_DIRESULT_PER_TYPE (
    OWNER,
    CONSTRAINT_TYPE,
    CNT_RESULTS,
    TOTAL_CNT_RESULTS
)
AS
SELECT
    a.OWNER,
    decode(b.TYPE, 'N/A', 'tuple or column', b.TYPE) TYPE,
    count(*),
    A.TOTAL_CNT_RESULTS    
FROM    DIMGR.V_MOST_RECENT_DIRESULTS a
            LEFT OUTER JOIN
            DIMGR.V_ALL_DICONS_NOTNULL_VALQ b
            on (A.OWNER = B.OWNER AND A.TABLE_NAME = B.TABLE_NAME AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME AND A.COLUMN_NAME = B.COLUMN_NAME)
GROUP BY
    a.OWNER,
    b.TYPE,
    A.TOTAL_CNT_RESULTS
            
    
    
          TOTAL_RESULTS
from (          
    select  b.*, A.TEST_ID, A.RESULT, A.POPULATION_DATE, a.total_results
    from (select * from V_MOST_RECENT_DIRESULTS where constraint_name is  null) a 
                join (select * from dimgr.V_ALL_DICONSTRAINTS where constraint_name LIKE 'N/A')  b 
                    on (A.OWNER = B.OWNER and A.TABLE_NAME = b.table_name 
                                and A.CONSTRAINT_NAME = B.CONSTRAINT_NAME) 
    union all
    select b.*, A.TEST_ID, A.RESULT, A.POPULATION_DATE, a.total_results
    from (select * from V_MOST_RECENT_DIRESULTS where column_name is not null) a 
                join (select * from V_ALL_DICONSTRAINTS where column_name NOT LIKE 'N/A' )  b 
                    on (A.OWNER = B.OWNER and A.TABLE_NAME = b.table_name 
                                and A.column_name = B.column_name) 
)                            
group by         
    owner, 
    CONS_TYPE,
    TOTAL_RESULTS
 */   
/*    
    Get  ALL failed results
*/

/*
CREATE OR REPLACE VIEW V_ALL_FAILED_RESULTS
AS
select b.*, A.TEST_ID, A.RESULT, A.POPULATION_DATE, a.total_results
from (select * from V_MOST_RECENT_DIRESULTS where constraint_name is not null) a 
            join (select * from V_ALL_DICONSTRAINTS where constraint_name IS NOT NULL)  b 
                on (A.OWNER = B.OWNER and A.TABLE_NAME = b.table_name 
                            and A.CONSTRAINT_NAME = B.CONSTRAINT_NAME) 
where
nvl (a.result, 1) <> 0         
union all
select b.*, A.TEST_ID, A.RESULT, A.POPULATION_DATE, a.total_results
from (select * from V_MOST_RECENT_DIRESULTS where column_name is not null) a 
            join (select * from V_ALL_DICONSTRAINTS where column_name IS NOT NULL)  b 
                on (A.OWNER = B.OWNER and A.TABLE_NAME = b.table_name 
                            and A.column_name = B.column_name) 
where
nvl (a.result, 1) <> 0         
*/
/*
 Failed results per type
*/
/*
select  a.owner, 
          a.CONS_TYPE
          ,sum(case when result IS NULL then 1 else null end) null_results
          ,sum(case when result <> 0 then 1 else null end )  non_zero_results
          , count(*) total_failed_results
          , total_results
from  V_ALL_FAILED_RESULTS a join V_GROUP_DIRESULT_PER_TYPE b on (a.owner = b.owner and a.cons_type = b.cons_type)
group by   
            a.owner
            ,a.CONS_TYPE 
            ,total_results               
*/
--------------------------------- DRAFT -----------------

select * from V_MOST_RECENT_DIRESULTS 
where constraint_name  like 'N/A'

select last_updated_by, count(*)
from DIMGR.V_BAD_QUERIES
where owner = 'PRESENT_PERIF'
group by last_updated_by

select *
from (
select last_updated_by, count(*) bad_queries
from DIMGR.V_BAD_QUERIES
where owner = 'PRESENT_PERIF'
group by last_updated_by
) t1 join
(
select last_updated_by, count(*) all_queries
from DIMGR.V_ALL_DICONSTRAINTS
where owner = 'PRESENT_PERIF' and CONS_VAL_QUERY is not null
and LAST_UPDATED > to_date('01/02/2011', 'dd/mm/yyyy')
group by last_updated_by
) t2
using (last_updated_by)


select *
from DIMGR.V_BAD_QUERIES
where last_updated_by = 'NKARAG'
 and owner = 'PRESENT_PERIF'

select *
from V_OUTPUT

select *
from dimgr.diresults 
where nvl(result, 1) <> 0

 select 
                             test_id
                             ,owner
                             ,table_name
                             ,column_name
                             ,constraint_name
                             ,result
                             ,population_date
                     from (    
                         select
                             test_id
                             ,owner
                             ,table_name
                             ,column_name
                             ,constraint_name
                             ,result
                             ,population_date
                             ,row_number() over(partition by owner, table_name, column_name, constraint_name  order by population_date desc)  r              
                         from  dimgr.diresults
                     ) t
                     where
                         t.r =   1          

