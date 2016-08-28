select ad_client_id, name, fullname, password, ad_user_id, ISACTIVE from ad_user
where remove_sign(name) like remove_sign('%kanhtckt%');

select name, password from ad_user where 
remove_sign(name) like remove_sign('tiepdon');

select ad_user_id,name from ad_user;-- where name like '%Admin%';
select * from ad_user_roles;   

update ad_user set PASSWORD = '6' where name like '6';
select * from AD_ROLE where name like '%Admin%';

 -- TTTM: @#AD_Role_ID@!1100007
  
 --BVE: @#AD_Role_ID@!1000018;