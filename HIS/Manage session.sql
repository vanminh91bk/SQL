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
  
  
  
  
