exp system/oracle@DWHDEV FILE=dimgr.dmp OWNER=DIMGR GRANTS=y ROWS=y COMPRESS=y

exp system/oracle@DWHTEST FILE=dimgr.dmp OWNER=DIMGR GRANTS=y ROWS=y COMPRESS=y



----

exp system/oracle@DWHTEST FILE=present_perif.dmp OWNER=PRESENT_PERIF GRANTS=y ROWS=n COMPRESS=y

exp system/oracle@DWHDEV FILE=compl_dw.dmp OWNER=COMPL_DW GRANTS=y ROWS=n COMPRESS=y