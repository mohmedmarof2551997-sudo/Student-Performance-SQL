-- Retrieve all columns and rows from the Students table
SELECT * FROM Students

-- Select only lifestyle-related columns for each student
SELECT study_hours, social_media_hours, sleep_hours, caffeine_intake_mg, part_time_job FROM students

-- Count the total number of students in the table
SELECT COUNT(*) FROM students

-- Calculate the average exam score across all students
SELECT AVG(exam_score) AS average FROM students

-- Find the highest exam score recorded
SELECT MAX(exam_score) AS max FROM students

-- Find the lowest exam score recorded
SELECT MIN(exam_score) AS min FROM students

-- Show average exam score grouped by each sleep hours value, ordered by sleep hours
SELECT sleep_hours, AVG(exam_score) AS 'average of exam by sleep hour'
FROM students
GROUP BY sleep_hours
ORDER BY sleep_hours

-- Show average exam score grouped by each study hours value, ordered by study hours
SELECT study_hours, AVG(exam_score) AS 'average of exam by study hour'
FROM students
GROUP BY study_hours
ORDER BY study_hours

-- Show average exam score by social media hours for students who have a part-time job
SELECT social_media_hours, AVG(exam_score) AS 'average of exam by social media hour'
FROM students
WHERE part_time_job = 1
GROUP BY social_media_hours
ORDER BY social_media_hours

-- Show average exam score by social media hours for students without a part-time job
SELECT social_media_hours, AVG(exam_score) AS 'average of exam by social media hour'
FROM students
WHERE part_time_job = 0
GROUP BY social_media_hours
ORDER BY social_media_hours

-- Show average exam score by social media hours for students sleeping between 5 and 10 hours
SELECT social_media_hours, AVG(exam_score) AS 'average of exam by social media hour'
FROM students
WHERE sleep_hours BETWEEN 5 AND 10
GROUP BY social_media_hours
ORDER BY social_media_hours

-- Add a new integer column called Total_leisure_time to the students table
ALTER TABLE students ADD Total_leisure_time INT;

-- Populate Total_leisure_time by summing social media, gaming, and screen time hours
UPDATE students SET Total_leisure_time = social_media_hours + gaming_hours + screen_time_hours;

-- Retrieve all columns including the newly added Total_leisure_time column
SELECT * FROM students

-- Retrieve only the Total_leisure_time column for all students
SELECT Total_leisure_time FROM students

-- Show average exam score and student count grouped by sleep hours and total leisure time
SELECT sleep_hours, Total_leisure_time, AVG(exam_score) AS avg_exam_score, COUNT(*) AS num_students
FROM students
GROUP BY sleep_hours, Total_leisure_time
ORDER BY sleep_hours, Total_leisure_time;








