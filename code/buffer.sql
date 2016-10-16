select lower(user) || '@' || substr(global_name, 1, decode(dot, 0, length(global_name), dot-1)) global_name
from (select global_name, instr(global_name,'.') dot from global_name )
/
