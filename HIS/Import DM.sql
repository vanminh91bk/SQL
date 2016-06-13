delete from HIS_Accessory where Created > trunc(sysdate);
update HIS_Accessory set IsActive = 'Y' where Created > trunc(sysdate);
select * from HIS_AccessoryGroup;
update HIS_Accessory set IsHighTech = 'Y' where HIS_AccessoryGroup_ID = 1000082 and Created > trunc(sysdate);

update HIS_Accessory set HIS_Manufacturer_ID = null where trunc(created) = to_date('14-05-2016' , 'DD-MM-YYYY');

update HIS_Accessory set IsSurgery = 'N' where IsSurgery is null;
update HIS_Accessory set IsExpireDate = 'N' where IsExpireDate is null;
update HIS_Accessory set IsMedicine = 'N' where IsMedicine is null;
update HIS_Accessory set IsTrade = 'N' where IsTrade is null;
update HIS_Accessory set IsApproveOutpatient = 'N' where IsApproveOutpatient is null;
update HIS_Accessory set IsApproveInpatient = 'N' where IsApproveInpatient is null;
update HIS_Accessory set IsNotUsed = 'N' where IsNotUsed is null;
update HIS_Accessory set IsDeleted = 'N' where IsDeleted is null;
update HIS_Accessory set IsDoNotUse = 'N' where IsDoNotUse is null;
update HIS_Accessory set IsMinorSurgery = 'N' where IsMinorSurgery is null;
update HIS_Accessory set IsPackageApply = 'N' where IsPackageApply is null;



delete from HIS_Surgery where Created > trunc(sysdate) and HIS_SurgeryType_ID = 'PT';
select * from HIS_Surgery where Created > trunc(sysdate) and HIS_SurgeryType_ID = 'PT';
select count(*) from HIS_Surgery where Created > trunc(sysdate) and HIS_SurgeryType_ID = 'PT';
delete from HIS_SurgeryPackage where Created > trunc(sysdate) and HIS_SurgeryType_ID = 'PT';
delete from HIS_SurgeryPackage_Service where Created > trunc(sysdate);
select count(*) from HIS_SurgeryPackage_Service where HIS_SurgeryPackage_ID not in (select HIS_SurgeryPackage_ID from HIS_SurgeryPackage);

update HIS_Surgery set HIS_SurgeryType_ID = 'PT' where  HIS_Surgery_ID=1010991;


update HIS_SurgeryPackage set isActive = 'N' where  HIS_SurgeryPackage_ID=1000447;

select * from HIS_Accessory where isActive = 'Y' and isOutPatient = 'N';
select * from HIS_Medicaltest where isActive = 'Y' and isOutPatient = 'N' and Created < trunc(sysdate) -1;

update HIS_Medicaltest set IsActive = 'N' where isActive = 'Y' and isOutPatient = 'N' and Created < trunc(sysdate) -1;
update HIS_Medicaltest set IsActive = 'Y', isOutPatient = 'N', isInPatient = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;

update HIS_Surgery set IsActive = 'N' where isActive = 'Y' and isOutPatient = 'N' and Created < trunc(sysdate) -1;
update HIS_Surgery set IsActive = 'Y', isOutPatient = 'N', isInPatient = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;

update HIS_Imagediagnostic set IsActive = 'N' where isActive = 'Y' and isOutPatient = 'N' and Created < trunc(sysdate) -1;
update HIS_Imagediagnostic set IsActive = 'Y', isOutPatient = 'N', isInPatient = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;

update HIS_Medicaltest set IsActive = 'N' where isActive = 'Y' and isOutPatient = 'N' and Created < trunc(sysdate) -1;
update HIS_Medicaltest set IsActive = 'Y', isOutPatient = 'N', isInPatient = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;

update HIS_Accessory set IsActive = 'N' where isActive = 'Y' and Created < trunc(sysdate) -1;
update HIS_Accessory set IsActive = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;

update HIS_Chemical set IsActive = 'N' where isActive = 'Y' and Created < trunc(sysdate) -1;
update HIS_Chemical set IsActive = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;

update HIS_Medicine set IsActive = 'N' where isActive = 'Y' and Created < trunc(sysdate) -1
and HIS_Service_ID not in (select HIS_Service_ID from HIS_Storage_Summary where  HIS_Storage_ID=1000320);
update HIS_Medicine set IsActive = 'Y' where isActive = 'N' and Created > trunc(sysdate) -1;
select * from HIS_Medicine where Created > trunc(sysdate) -1;


delete from HIS_Service_Department where HIS_Service_ID in (select HIS_Service_ID from HIS_Service where IsActive = 'N');

select IsActive, isOutPatient, IsInPatient  from HIS_Medicaltest where HIS_Service_ID = 200340003;

select HIS_Service_ID from HIS_Storage_Summary where  HIS_Storage_ID=1000320;


select count(*) from HIS_Accessory where Created > trunc(sysdate) -1;


select * from HIS_Medicine where upper(TradeName) like upper('aprovel 150mg');