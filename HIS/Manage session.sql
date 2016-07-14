select
   c.owner,
   c.object_name,
   c.object_type,
   b.sid,
   b.serial#,
   'ALTER SYSTEM KILL SESSION ''' || b.sid || ', ' || b.serial# || ''';' AS KILL_COMMAND,
   b.status,
   b.osuser,
   b.machine
from
   v$locked_object a ,
   v$session b,
   dba_objects c
where
   b.sid = a.session_id
and
   a.object_id = c.object_id;
and 
  b.status like 'INACTIVE';
  
  
  
  
ALTER SYSTEM KILL SESSION '2481, 28324';
ALTER SYSTEM KILL SESSION '2277, 59271';
ALTER SYSTEM KILL SESSION '2086, 9637';
ALTER SYSTEM KILL SESSION '1899, 60325';
ALTER SYSTEM KILL SESSION '1718, 59179';
ALTER SYSTEM KILL SESSION '587, 36845';