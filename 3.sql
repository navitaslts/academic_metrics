--3. Completion Index = how many terms it takes a student to complete vs how long it should take -  hard code how long it should take
SELECT
	AdEnrollSched.SyStudentID,
	AdEnrollSched.AdEnrollID,
	SyCampus.DescriP AS Campus,
	RTRIM(LTRIM(AdPRogramVersion.Code)) AS ProgramCode,
	AdProgramVersion.Descrip AS Program,
	COUNT(DISTINCT(AdEnrollSched.AdTermID)) AS num_of_terms_to_complete,
	num_of_terms_program = (CASE WHEN AdProgramVersion.Code IN ('AU516 _EMY', 'AU517', 'EB517', 'EB517_EMY', 'MB50317_EM', 'MBPD-S') 
									THEN 3
								WHEN AdProgramVersion.Code IN ('ATPA-SEM', 'ATPAATL', 'ATPD-FT', 'ATPD-SEM', 'ATPDATL FT', 'ATPDFT', 'ATPDFT_EMY', 'ATPDNY12', 'ATPDPT', 'AU616 _EMY', 'AU617', 'DF618', 'EB617', 'EB617_EMY', 'MB61703_EM', 'MBPA-S') 
									THEN 4
								 WHEN AdProgramVersion.Code IN ('AU70118', 'AU716_EMY', 'AVE 2012 B', 'AVE 5/2015', 'DF 2012B', 'DF 5/2015', 'GAD 2012 B', 'GAD 5/2015', 'GAD 5/2016', 'GD717_EMY', 'GDM 2014 A', 'GDM 5/2015', 'IA 2012 B', 'IA 5/2015', 'SA 5/2015', 'SA2012 B') 
									THEN 8 END)
FROM CampusVue.dbo.AdEnrollSched 
JOIN CampusVue.dbo.AdEnroll ON AdEnrollSched.AdEnrollID = AdEnroll.AdEnrollID
JOIN CampusVue.dbo.SySchoolStatus ON AdEnroll.SySchoolStatusID = SySchoolStatus.SySchoolStatusID
JOIN CampusVue.dbo.AdProgramVersion ON AdEnroll.adProgramVersionID = ADProgramVersion.AdProgramVersionID
JOIN CampusVue.dbo.SyCampus ON AdEnroll.SyCampusID = SyCampus.SyCampusID
WHERE 1=1 
AND SySchoolStatus.Descrip LIKE ('%graduate%')
AND AdEnrollSched.AdClassSchedID != 0
AND YEAR(AdEnroll.LDA) > 2016
GROUP BY AdEnrollSched.SyStudentID,
		AdEnrollSched.AdEnrollID,
		SyCampus.Descrip,
		AdPRogramVersion.Code,
		AdProgramVersion.Descrip
ORDER BY SyStudentID, AdEnrollID