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
   a.object_id = c.object_id
   
and c.object_name not in ( 'AD_ARCHIVE', 'AD_ATTACHMENT', 'AD_CHANGELOG', 'AD_COLUMN',  'AD_NOTE', 'AD_MESSAGE', 'AD_SESSION', 'AD_TABLE', 'AD_SEQUENCE');
and 
  b.status like 'INACTIVE';
  ALTER SYSTEM KILL SESSION '2465, 45413';
  

select count(*) sum, box, os_user, program from (select
       substr(b.machine,1,60) box,
       substr(b.username,1,10) username,
       substr(b.osuser,1,80) os_user,
       substr(b.program,1,30) program
from v$session b, v$process a
where
b.paddr = a.addr
and type='USER'
order by box, spid ) where PROGRAM = 'JDBC Thin Client' group by box, os_user, program order by program;

ALTER SYSTEM KILL SESSION '145, 2591';