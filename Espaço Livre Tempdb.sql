SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT SUM(user_object_reserved_page_count
		+ internal_object_reserved_page_count
		+ version_store_reserved_page_count
		+ mixed_extent_page_count
		+ unallocated_extent_page_count) * (8.0/1024.0)
										AS [TotalSizeOfTempDB(MB)]
	, SUM(user_object_reserved_page_count
		+ internal_object_reserved_page_count
		+ version_store_reserved_page_count
		+ mixed_extent_page_count) * (8.0/1024.0)
										AS [UsedSpace (MB)]
	, SUM(unallocated_extent_page_count * (8.0/1024.0))
										AS [FreeSpace (MB)]
FROM sys.dm_db_file_space_usage



