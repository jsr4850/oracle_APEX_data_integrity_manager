declare
l_c PLS_integer;
l_sql varchar2(4000);
begin

l_sql := 'select 8 from dual where';
l_c := dbms_sql.open_cursor; 
DBMS_SQL.PARSE (
   c => l_c,
   statement => l_sql,
   language_flag      => 1);
   
   DBMS_SQL.CLOSE_CURSOR(l_c);
EXCEPTION
    WHEN OTHERS THEN             
            dbms_output.put_line(SQLCODE||': '||SQLERRM);
            DBMS_SQL.CLOSE_CURSOR(l_c);   
end;
/   