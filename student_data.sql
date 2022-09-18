SELECT
b.id, b.first_name, b.last_name, b.email, d.country, b.role, a.language, b.total_logins, b.account_status,
c.course_id, c.score, c.completion_percent, c.learning_skills_listening, c.learning_skills_writing, c.learning_skills_speaking, c.learning_skills_reading,
f.unit_id, f.score AS unit_score, f.completion_percent AS unit_completion_percent, f.learning_skills_listening AS unit_listening_skills, f.learning_skills_writing AS unit_writing_skills, f.learning_skills_speaking AS unit_speaking_skills, f.learning_skills_reading AS unit_reading_skills
FROM ell_user_language AS a
INNER JOIN ell_user_user AS b ON a.id = b.language_id
INNER JOIN ell_user_usercourseprogressvalues AS c ON b.id = c.user_id
INNER JOIN ell_user_userdetail AS d ON b.id = d.user_id
INNER JOIN ell_user_userunitprogressvalues AS f ON b.id = f.user_id
WHERE b.role = 'student'
ORDER BY b.id ASC LIMIT 100