-- 2. Pass Rate = for each course binary for pass/fail
SELECT 
	SyCampus.Descrip AS Campus,
	AdTerm.Code AS TermCode,
	AdTerm.StartDate AS TermStart,
	AdTerm.EndDate AS TermEnd,
	AdEnrollSched.SyStudentID,
	AdCourse.Code AS CourseCode,
	AdCourse.Descrip AS Course,
	--NumericGrade,
	--AdGradeLetterCode,
	is_passing_grade = (CASE WHEN AdGradeLetterCode IN ('A', 'A+', 'A-', 'B', 'B-', 'B+', 'C', 'C-', 'C+', 'D', 'D-', 'D+') THEN 1 
							 WHEN AdGradeLetterCode = 'F' THEN 0 END)
FROM CampusVue.dbo.AdEnrollSched
JOIN CampusVue.dbo.AdEnroll ON AdEnrollSched.AdEnrollID = AdEnroll.AdEnrollID
JOIN CampusVue.dbo.AdCourse ON AdEnrollSched.AdCourseID = AdCourse.AdCourseID
JOIN CampusVue.dbo.SyCampus ON AdEnroll.SyCampusID = SyCampus.SyCampusID
LEFT JOIN CampusVue.dbo.AdTerm ON AdEnrollSched.AdTermID = AdTerm.AdTermID
WHERE 1 = 1
AND AdClassSchedID !=0
AND AdEnrollSched.Descrip NOT LIKE ('%Practical Attendance%')
AND AdEnrollSched.Status = 'P'