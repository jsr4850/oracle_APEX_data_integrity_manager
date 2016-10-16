/*
Add a validation query for each FK constraint
*/
-- select count(*) from owner.table_name where columns not in (select pkcolumns from pkowner.pktable_name)
select 'SELECT COUNT(*) FROM '|| t1.OWNER||'.'|| t1.TABLE_NAME||' where ('||t1.columns||') not in (select '||t2.pkcolumns||' from ' || t2.pkowner||'.'||t2.pktable_name||')'
from 
(
select  A.OWNER, A.TABLE_NAME,  A.CONSTRAINT_NAME, a.REF_PKOWNER, a.REF_PKTABLE_NAME, a.REF_PKCONSTRAINT_NAME
    , wmsys.wm_concat(B.COLUMN_NAME) as columns
from DIMGR.INTER_TABLE_CONSTRAINTS a join DIMGR.ITABLE_CONSTRAINTS_REF_COLUMNS b on (A.OWNER = B.OWNER and A.TABLE_NAME = B.TABLE_NAME and  A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)
where
A.TYPE = 'R'
and A.CONSTRAINT_VALIDATION_QRY is null
group by A.OWNER, A.TABLE_NAME,  A.CONSTRAINT_NAME, a.REF_PKOWNER, a.REF_PKTABLE_NAME, a.REF_PKCONSTRAINT_NAME
) t1,
(
select  A.OWNER pkowner, A.TABLE_NAME pktable_name,  A.CONSTRAINT_NAME pkconstraint_name, wmsys.wm_concat(B.COLUMN_NAME) as pkcolumns
from DIMGR.TABLE_CONSTRAINTS a join DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b on (A.OWNER = B.OWNER and A.TABLE_NAME = B.TABLE_NAME and  A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)
where
A.TYPE = 'P'
group by A.OWNER, A.TABLE_NAME,  A.CONSTRAINT_NAME
) t2
where
t1.ref_pkowner = t2.pkowner and
t1.ref_pktable_name = t2.pktable_name and
t1.ref_pkconstraint_name = t2.pkconstraint_name 

SELECT COUNT(*) FROM PRESENT_PERIF.NP_DIM where (NP_BILLING_ACCOUNT_SK) not in (select BILLING_ACCOUNT_SK from TARGET_DW.BILLING_ACCOUNT_DIM)




/*
Add a validation query for each PK, UK constraints
*/

select 'select count(*) from (SELECT '||t2.pkcolumns||', COUNT(*) FROM '|| t2.pkowner||'.'||t2.pktable_name||' group by '||t2.pkcolumns||' having count(*) > 1'||')'
from 
(
select  A.OWNER pkowner, A.TABLE_NAME pktable_name,  A.CONSTRAINT_NAME pkconstraint_name, wmsys.wm_concat(B.COLUMN_NAME) as pkcolumns
from DIMGR.TABLE_CONSTRAINTS a join DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b on (A.OWNER = B.OWNER and A.TABLE_NAME = B.TABLE_NAME and  A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)
where
A.TYPE in ('P','U')
and A.CONSTRAINT_VALIDATION_QRY is null
group by A.OWNER, A.TABLE_NAME,  A.CONSTRAINT_NAME
) t2


select count(*) from (SELECT TEK_SK, COUNT(*) FROM TARGET_DW.TEK_DIM group by TEK_SK having count(*) > 1)
select count(*) from (SELECT CABINET_SK,CITYCENTER_SK,DSLAM_SK,PORT_DSLAM,ONU_SK, COUNT(*) FROM PRESENT_PERIF.PORT_DIM group by CABINET_SK,CITYCENTER_SK,DSLAM_SK,PORT_DSLAM,ONU_SK having count(*) > 1)

-- update PK/UK validation queries for a single table
for r in (select * from DIMGR.TABLE_CONSTRAINTS t where t.OWNER = :tblowner  and t.table_name = :name and t.TYPE in ('P','U')
        and t.CONSTRAINT_VALIDATION_QRY is null)
loop
update DIMGR.TABLE_CONSTRAINTS tt
    set T.CONSTRAINT_VALIDATION_QRY = 
    (
        select 'select count(*) from (SELECT '||t2.pkcolumns||', COUNT(*) FROM '|| t2.pkowner||'.'||t2.pktable_name||' group by '||t2.pkcolumns||' having count(*) > 1'||')'
        from 
        (
        select  A.OWNER pkowner, A.TABLE_NAME pktable_name,  A.CONSTRAINT_NAME pkconstraint_name, wmsys.wm_concat(B.COLUMN_NAME) as pkcolumns
        from DIMGR.TABLE_CONSTRAINTS a join DIMGR.TABLE_CONSTRAINTS_REF_COLUMNS b on (A.OWNER = B.OWNER and A.TABLE_NAME = B.TABLE_NAME and  A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)
        where
        a.owner = r.owner  and a.table_name = r.table_name and a.constraint_name = r.constraint_name
        group by A.OWNER, A.TABLE_NAME,  A.CONSTRAINT_NAME
        ) t2
     )
     where
             tt.OWNER = :tblowner  and tt.table_name = :name
end loop;             