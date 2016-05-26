select * from v$database_block_corruption;

select 
   relative_fno, 
   owner, 
   segment_name, 
   segment_type
from 
   dba_extents
where 
   file_id = 4
and 
   ((1621497 between block_id and block_id + blocks - 1) or (789586 between block_id and block_id + blocks - 1) or (956936 between block_id and block_id + blocks - 1));