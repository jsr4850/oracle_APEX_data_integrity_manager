set    termout off     
   
store  set sqlplus_settings replace
save   buffer.sql replace

-- for large sql statements
set    longchunksize 1000
set    linesize 500
set    heading off verify off autotrace off feedback off
set    timing off

spool  output.sql replace

select text
from dimgr.output;

spool  off

get    buffer.sql nolist
@sqlplus_settings
set    termout on   