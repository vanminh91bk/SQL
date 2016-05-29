select CALLOUT from AD_Column where AD_Table_ID = 1000012; --Table PatientHistory

SELECT HIS_Service_ID, Created , HIS_ServiceType, HIS_Service_Record_ID
FROM HIS_Service_Union 
WHERE HIS_PatientHistory_ID IN (SELECT HIS_PatientHistory_ID FROM HIS_PatientHistory WHERE Value='1605000351') 
AND ((AmountA > 0 AND IsPaidA ='N') OR (AmountS > 0  AND IsPaidS ='N')) AND IsActive='Y';


Update HIS_Service_Medicine set IsPaid = 'Y', IsPaidA = 'Y', IsPaidS = 'Y' 
where HIS_PatientHistory_ID in (select HIS_PatientHistory_ID from HIS_PatientHistory where value = '1605000351');

Update HIS_Service_MajorSurgery set IsPaid = 'Y', IsPaidA = 'Y', IsPaidS = 'Y' 
where HIS_PatientHistory_ID in (select HIS_PatientHistory_ID from HIS_PatientHistory where value = '1605000351');


select * from HIS_Service_Union;