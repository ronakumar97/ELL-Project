SELECT
b.id, b.first_name, b.last_name, b.email, d.country, b.role, a.language, b.total_logins, b.account_status,
c.course_id, c.score, c.completion_percent, c.learning_skills_listening, c.learning_skills_writing, c.learning_skills_speaking, c.learning_skills_reading,
e.level_id, e.score AS level_score, e.completion_percent AS level_completion_percent, e.learning_skills_listening AS level_listening_skills, e.learning_skills_writing AS level_writing_skills, e.learning_skills_speaking AS level_speaking_skills, e.learning_skills_reading AS level_reading_skills,
f.unit_id, f.score AS unit_score, f.completion_percent AS unit_completion_percent, f.learning_skills_listening AS unit_listening_skills, f.learning_skills_writing AS unit_writing_skills, f.learning_skills_speaking AS unit_speaking_skills, f.learning_skills_reading AS unit_reading_skills,
g.lesson_id, g.progress_data, g.sco_number, g.attempts AS lesson_attempts,
h.progress_data as userexitprogressdata,h.attempts as userexittable_attempts,
i.progress_data as userleveltestprogressdata,i.attempts as userlevelprogresstable_attempts,
j.progress_data as placementtestprogressdata,j.attempts as placementtestprogresstable_attempts,
k.progress_data as unittestprogress,k.attempts as unittestprogresstable_attempts,
n.name as rawlevel_name, n.description as raelevel_description,
o.name as rawtest_name, o.description as rawtest_description,
l.name as rawunit_name,l.description as rawunit_description,
m.name as rawlesson_name,m.description as rawlesson_description
FROM ell_user_language AS a
INNER JOIN ell_user_user AS b ON a.id = b.language_id
INNER JOIN ell_user_usercourseprogressvalues AS c ON b.id = c.user_id
INNER JOIN ell_user_userdetail AS d ON b.id = d.user_id
INNER JOIN ell_user_userlevelprogressvalues AS e ON b.id = e.user_id
INNER JOIN ell_user_userunitprogressvalues AS f ON b.id = f.user_id
INNER JOIN ell_user_userlessonprogress AS g ON b.id = g.user_id
-- INNER JOIN ell_user_userunittestprogress AS d ON a.id = d.user_id
--INNER JOIN ell_user_userlevelrestriction AS d ON a.id = d.user_id
inner join ell_user_userexittestprogress AS h on b.id=h.user_id
INNER JOIN ell_user_userleveltestprogress AS i ON h.user_id = i.user_id 
inner join ell_user_userplacementtestprogress as j ON j.user_id = h.user_id
INNER JOIN ell_user_userunittestprogress AS k ON k.user_id = h.user_id 
inner join product_rawlevel as n on n.course_id=j.course_id 
inner join product_rawtest as o on o.id = k.test_id
inner join product_rawunit as l on l.level_id = n.id
inner join product_rawlesson as m on m.unit_id = l.id 
WHERE b.role = 'student' and f.completion_percent <> 'N/A'
ORDER BY b.id ASC LIMIT 100