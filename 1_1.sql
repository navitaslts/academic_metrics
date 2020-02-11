-- 1.1 Commencing Students = new students per term
SELECT DISTINCT
	AdEnrollSched.SyStudentID,
	AdEnrollSched.AdEnrollID,
	AdEnrollSched.AdEnrollSchedID,
	SyCampus.Descrip AS Campus,
	AdTerm.Code AS TermCode,
	AdTerm.StartDate AS TermStart,
	AdTerm.EndDate AS TermEnd
into #first_terms
FROM CampusVue.dbo.AdEnrollSched 
JOIN CampusVue.dbo.AdTerm ON AdEnrollSched.AdTermID = AdTerm.AdTermID
JOIN CampusVue.dbo.AdEnroll ON AdEnrollSched.AdEnrollID = AdEnroll.AdEnrollID
JOIN CampusVue.dbo.SyCampus ON AdEnroll.SyCampusID = SyCampus.SyCampusID
INNER JOIN (SELECT
		SyStudentID,
		AdEnrollID,
		MIN(AdEnrollSchedId) AS min_sched_id
	FROM CampusVue.dbo.AdEnrollSched
	LEFT JOIN CampusVue.dbo.AdTerm ON AdEnrollSched.AdTermID = AdTerm.AdTermID
	WHERE 1 = 1
	AND AdClassSchedID !=0
	AND AdEnrollSched.Descrip NOT LIKE ('%Practical Attendance%')
	GROUP BY SyStudentID, AdEnrollID) AS min_sched_id 
	ON AdEnrollSched.SyStudentID = min_sched_id.SyStudentID
	AND AdEnrollSched.AdEnrollID = min_sched_id.AdEnrollID
	AND AdEnrollSched.AdEnrollSchedID = min_sched_id.min_sched_id
WHERE 1 = 1
AND AdClassSchedID !=0
AND AdEnrollSched.Descrip NOT LIKE ('%Practical Attendance%')
SELECT
	Campus,
	TermCode,
	TermStart,
	TermEnd,
	Count(*) AS first_term_students
FROM #first_terms
GROUP BY Campus, TermCode, TermStart, TermEnd
ORDER BY TermStart DESC
DROP TABLE #first_terms