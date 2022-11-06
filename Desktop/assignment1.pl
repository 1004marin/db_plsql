DECLARE
   x_dept_name varchar(20); --학과이름(오름차순정렬필요)
   x_name varchar(20); --학생이름(오름차순정렬필요)
   x_credits numeric(3,0); -- 해당과목 학점 수
   x_semester varchar(8);
   x_year numeric(4,0);
   x_grade varchar(5);
   x_course_id varchar(8);
   x_title varchar(50);
   x_id varchar(10);
   x_total_credits numeric(5);
   x_gpa numeric(3,2);

   CURSOR c0 is--학과이름
      SELECT distinct (dept_name)  
      FROM student
      order by dept_name asc;--학과오름차순
        
   CURSOR c1 is--학생이름
      SELECT id, name, dept_name  
      FROM student
      where dept_name = x_dept_name
      order by name asc;--이름오름차순
        
   CURSOR c2 is -- 내용
      SELECT T.ID, C.title, C.credits, T.semester, T.year, case WHEN (T.grade is null) THEN '-' ELSE T.grade END
      FROM takes T, course C
      where C.course_id = T.course_id and T.ID = x_id
      ORDER BY T.year asc, 
                CASE WHEN T.semester = 'Spring' THEN 0 
                     WHEN T.semester = 'Summer' THEN 1 ELSE 2 END;


   CURSOR c3 is -- 총학점수, GPA
        select id, sum(grade_to_num * credits)/sum(credits), sum(credits)
        from(
        SELECT T.id, C.CREDITS, 
                        case when t.grade = 'A+' THEN '4.3'
                            when t.grade = 'A' THEN '4'
                            when t.grade = 'A-' THEN '3.7'
                            when t.grade = 'B+' THEN '3.3'
                            when t.grade = 'B' THEN '3'
                            when t.grade = 'B-' THEN '2.7'
                            when t.grade = 'C+' THEN '2.3'
                            when t.grade = 'C' THEN '2'
                            when t.grade = 'C-' THEN '1.7'
                            when t.grade = 'F' THEN '0'
                        END as grade_to_num
        FROM takes T, course C
        where C.course_id = T.course_id
        and t.grade is not null
        )
        where id = x_id
        group by id;

BEGIN
   OPEN c0;--
   LOOP
      FETCH c0 INTO x_dept_name;
      EXIT WHEN c0%NOTFOUND;
      dbms_output.put_line (x_dept_name);
      open c1;--
      loop
          fetch c1 into x_id, x_name, x_dept_name;
          exit when c1%NOTFOUND;
          dbms_output.put_line ('        '||x_name);
          open c2;--
          loop
            fetch c2 into x_id, x_title, x_credits, x_semester, x_year, x_grade;
            exit when c2%NOTFOUND;
            dbms_output.put_line('                '||x_title||' '||x_credits|| ' ' ||x_semester|| ' '||x_year||' ' || x_grade);
          end loop;
          close c2;
          open c3;
          loop
                fetch c3 into x_id, x_gpa, x_total_credits;
                exit when c3%NOTFOUND;
                dbms_output.put_line('                Total Credits: '||x_total_credits||'   GPA: '||x_gpa);
            end loop;
            close c3;
      end loop;
      close c1;
   END LOOP;
   CLOSE c0;
END;
