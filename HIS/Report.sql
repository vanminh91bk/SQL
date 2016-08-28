select * from REPORT_IN_MENU where MENUNAME like '%Cập nhật giá%';

SELECT HIS_Storage_Document_ID FROM HIS_Product_Import WHERE HIS_Service_ID=202693412 AND HIS_Storage_Document_ID IN ( SELECT HIS_Storage_Document_ID FROM HIS_Storage_Document WHERE HIS_STORAGE_ID = 1000334);
select * from HIS_STORAGE_SUMMARY where  HIS_SERVICE_ID =202693412;

select HIS_STORAGE_ID from HIS_STORAGE_DOCUMENT where HIS_STORAGE_ID = 1000334;

select * from HIS_STORAGE where HIS_STORAGE_ID in (1000463, 1000468);