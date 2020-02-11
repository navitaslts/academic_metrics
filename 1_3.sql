---- 1.3 Registered Students = total students per term
SELECT
	SyCampus.Descrip AS Campus,
	AdTerm.Code,
	AdTerm.StartDate AS TermStart,
	AdTerm.EndDate AS TermEnd,
	COUNT(DISTINCT(AdEnrollSched.AdEnrollID)) AS registered_students
FROM CampusVue.dbo.AdEnrollSched
JOIN CampusVue.dbo.AdTerm ON AdEnrollSched.AdTermID = AdTerm.AdTermID
JOIN CampusVue.dbo.AdEnroll ON AdEnrollSched.AdEnrollID = AdEnroll.AdEnrollID
JOIN CampusVue.dbo.SyCampus ON AdEnroll.SyCampusID = SyCampus.SyCampusID
WHERE 1 = 1
AND AdClassSchedID !=0
AND AdEnrollSched.Descrip NOT LIKE ('%Practical Attendance%')
GROUP BY SyCampus.Descrip, AdTerm.Code, AdTerm.StartDate, AdTerm.EndDate
ORDER BY TermStart DESC