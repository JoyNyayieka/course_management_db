-- Students who enrolled in at least one course.
select *
from Students s
join Enrollments e on s.student_id = e.student_id;

-- Students enrolled in more or equal to two courses.
select s.student_id, s.first_name, s.last_name, COUNT(e.course_id) AS course_count
from Students s
join Enrollments e on s.student_id = e.student_id
group by s.student_id
having COUNT(e.course_id) >= 2;

-- Courses with total enrolled students.
select c.course_id ,c.course_name, COUNT(e.student_id) AS total_students
from courses c
left join Enrollments e on c.course_id = e.course_id
group by c.course_id ,c.course_name;

-- Average grade per course (A=4, ..., F=0).
select c.course_id, c.course_name, 
round(avg(
	 case 
	 	when e.grade = 'A' then 4.0
	 	when e.grade = 'B' then 3.0
	 	when e.grade = 'C' then 2.0
	 	when e.grade = 'D' then 1.0
	 	when e.grade = 'F' then 0.0
	 	else null 
	 end
), 2) as average_grade
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name
order by c.course_id;

-- Students who haven’t enrolled in any course.
select s.student_id, s.first_name, s.last_name, e.course_id
from students s
join enrollments e on s.student_id = e.student_id
where e.course_id = null

-- Students with their average grade across all courses.
select s.student_id, s.first_name, s.last_name, 
round(avg(
	 case 
	 	when e.grade = 'A' then 4.0
	 	when e.grade = 'B' then 3.0
	 	when e.grade = 'C' then 2.0
	 	when e.grade = 'D' then 1.0
	 	when e.grade = 'F' then 0.0
	 	else null 
	 end
), 2) as average_grade, count(e.course_id) AS courses_taken
from students s
left join enrollments e on s.student_id = e.student_id
group by s.student_id, s.first_name, s.last_name
order by average_grade desc;

-- Instructors with the number of courses they teach.
select i.first_name, i.last_name, count(c.instructor_id) as total_courses
from instructors i
join courses c on i.instructor_id = c.instructor_id 
group by i.first_name, i.last_name;

-- Students enrolled in a course taught by “John Kimani”.
select s.first_name, s.last_name, c.course_name
from Students s
join Enrollments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id
join Instructors i on c.instructor_id = i.instructor_id
where i.first_name = 'John' and i.last_name = 'Kimani';

-- Top 3 students by average grade.
select s.first_name, s.last_name,
round(avg(
	 case 
	 	when e.grade = 'A' then 4.0
	 	when e.grade = 'B' then 3.0
	 	when e.grade = 'C' then 2.0
	 	when e.grade = 'D' then 1.0
	 	when e.grade = 'F' then 0.0
	 	else null 
	 end
), 2) as average_grade
from students s 
join enrollments e on s.student_id = e.student_id
group by s.first_name, s.last_name
order by average_grade desc
limit 3

-- Students failing (grade = ‘F’) in more than one course.
select s.student_id, s.first_name, s.last_name, count(e.course_id) AS failing_courses_count
from students s 
join enrollments e on s.student_id = e.student_id
where e.grade = 'F'
group by s.student_id,s.first_name, s.last_name
having count(e.course_id) > 1

-- Create a VIEW named student_course_summary (student name, course, grade).
create view student_course_summary as 
select s.first_name, s.last_name, e.course_id, e.grade
from students s
join enrollments e on s.student_id = e.student_id;

select * from student_course_summary;

-- Add an INDEX on Enrollments.student_id.
create index idx_enrollments_student_id on enrollments(student_id);

explain
select e.enrollment_id, e.course_id, e.grade
from Enrollments e
where e.student_id = 5;