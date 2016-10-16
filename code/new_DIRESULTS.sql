-- create new diresults
create table DIMGR.DIRESULTS_NEW
(           test_id,
            owner,
            table_name,
            constraint_name,            
            column_name,
            type,            
            result,            
            population_date,
            error_code,
            error_msg
)
AS 
SELECT 
    A.TEST_ID
    ,A.OWNER
    ,A.TABLE_NAME
    ,A.CONSTRAINT_NAME
    ,A.COLUMN_NAME
    ,case when 
                     b.type = 'N/A' AND a.column_name <> 'N/A' then 'column constraint' 
            when  b.type = 'N/A' AND a.column_name =  'N/A' then 'tuple constraint'
            else b.type
      END as type 
    ,A.RESULT
    ,A.POPULATION_DATE
    ,A.ERROR_CODE
    ,A.ERROR_MSG
FROM    DIMGR.V_MOST_RECENT_DIRESULTS a
            LEFT OUTER JOIN
            DIMGR.V_ALL_DICONS_NOTNULL_VALQ b
            on (A.OWNER = B.OWNER AND A.TABLE_NAME = B.TABLE_NAME AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME AND A.COLUMN_NAME = B.COLUMN_NAME);


alter table dimgr.diresults rename to diresults_old;             

alter table dimgr.diresults_new rename to diresults;


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
nvl(result, 1) <> 0;
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
WHERE nvl(result, 1) <> 0                            

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
