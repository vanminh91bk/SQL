select * from HIS_PatientHistory where HIS_PatientHistory_ID = 2045615;

select hsd.HIS_Service_ID, hsd.HIS_Room_ID, hs.HIS_Room_ID, hs.Name, hr.Name from HIS_Service_DiagnosticImage  hsd
inner join HIS_Room hr on hr.HIS_Room_ID = hsd.HIS_Room_ID
inner join HIS_Service hs on hs.HIS_Service_ID = hsd.HIS_Service_ID
where HIS_PatientHistory_ID = 2045615;

select * from HIS_InvoiceLine_V where HIS_PatientHistory_ID = 2045615;

select * from HIS_Service_MajorSurgery where NVL(Ref_Service_MajorSurgery_ID, 0) > 0;