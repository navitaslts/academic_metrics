-- program effeciency ratio distribution by campus, program, term
SELECT
	SyCampus.Descrip AS Campus,
	AdProgramVersion.Descrip AS ProgramVersion,
	--AdProgramVersion.Code AS ProgramVersionCode,
	AdTerm.Code AS term,
	AdEnrollSched.SyStudentID,
	--COUNT(DISTINCT(AdEnrollSched.AdEnrollID)) AS number_of_students, 
	SUM(Credits) AS total_credits,
	student_load = SUM(Credits) / (CASE WHEN SyCampus.Descrip IN ('SAE Miami', 'SAE New York') THEN 12.00 ELSE 16.00 END),
	max_credits = (CASE WHEN SyCampus.Descrip IN ('SAE Miami', 'SAE New York') THEN 12.00 ELSE 16.00 END)
	--EFTS = SUM(Credits)/12,
	--PER = (SUM(Credits)/12)/COUNT(AdEnrollSched.AdEnrollID)
FROM CampusVue.dbo.AdEnrollSched 
LEFT JOIN CampusVue.dbo.AdEnroll ON AdEnrollSched.AdEnrollID = AdEnroll.AdEnrollID
LEFT JOIN CampusVue.dbo.AdTerm ON AdEnrollSched.AdTermID = AdTerm.AdTermID
LEFT JOIN CampusVue.dbo.AdProgramVersion ON AdEnroll.adProgramVersionID = AdProgramVersion.AdProgramVersionID
LEFT JOIN CampusVue.dbo.SyCampus on AdEnroll.SyCampusID = SyCampus.SyCampusID
WHERE AdEnrollSched.Status NOT IN ('F','C')
AND AdTerm.Code IN ('1901W18','1901W15','1905W15','1909W15','1901W9','1903W18','1901W12','1904W12','1907W12','1904W9','1906W9','1908W9','1910W12','1910W9','1810W12','1810W15','1810W18','1810W9','1812W15')
AND AdEnrollSched.Descrip NOT LIKE ('Practical Attendance')
AND AdTerm.Code IS NOT NULL
--AND AdEnroll.LDA >= '2019-01-01'
--AND AdEnroll.StartDate < '2020-01-01'
--AND AdEnrollID IN (5827,12442)
GROUP BY SyCampus.Descrip, 
		AdProgramVersion.Descrip, 
		--AdProgramVersion.Code, 
		AdTerm.Code,
		AdEnrollSched.SyStudentID