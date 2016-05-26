Create Or Replace TRIGGER MEDICALTEST_IN_DEPARTMENT
  AFTER INSERT OR DELETE ON HIS_MedicalTest
  FOR EACH ROW
DECLARE
  CURSOR HIS_DEPARTMENTS Is 
    Select HIS_DEPARTMENT_ID 
    from HIS_DEPARTMENT where HIS_DEPARTMENT_ID > 0 AND ISCLINICAL = 'Y';
BEGIN
  IF DELETING THEN
    Delete From HIS_Service_Department where HIS_Service_ID = :old.HIS_Service_ID;
  ELSIF INSERTING THEN 
    FOR HIS_DEPARTMENT in HIS_DEPARTMENTS Loop
      insert into HIS_Service_Department 
        (AD_Client_ID, AD_Org_ID, Created, CreatedBy, HIS_DEPARTMENT_ID, HIS_Service_ID, IsActive,HIS_ServiceType, Updated, UpdatedBy,PRIORITYNO, HIS_SERVICE_DEPARTMENT_ID)
      values 
        (:new.AD_Client_ID,:new.AD_Org_ID, :new.Created, :new.CreatedBy, HIS_DEPARTMENT.HIS_Department_ID, :new.HIS_Service_ID, :new.IsActive,'MedicalTest',:new.Updated, :new.UpdatedBy,1000000,HIS_SERVICE_DEPARTMENT_SQ.nextval );
    END LOOP;
  END IF;
END;
/