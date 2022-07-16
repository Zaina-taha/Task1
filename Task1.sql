create table students( stid int primary key,stname varchar(20));
create table subject1(id int primary key,name varchar(20));
create table marks(primary key (stid,id),
				   stid int foreign key references students(stid),
				   id int foreign key references subject1(id),
				   grades int);
 

  insert into students VALUES(1, 'ahmed') ;  
  insert into students VALUES(2, 'ali') ;   
  insert into students VALUES(3, 'amani') ; 
   insert into students VALUES(4, 'salma') ;   
    insert into students VALUES(5, 'wisam') ;   
     insert into students VALUES(6, 'julia') ; 


	   insert into subject1 VALUES(11, 'arabic') ; 
       insert into subject1 VALUES(12, 'english') ; 
        insert into subject1 VALUES(13, 'math') ;  
         insert into subject1 VALUES(14, 'science') ;  
          insert into subject1 VALUES(15, 'religion') ;
          insert into subject1 VALUES(16, 'art') ;  



		     insert into marks VALUES(1,11, 70) ;
            insert into marks VALUES(1,12, 70) ;
             insert into marks VALUES(1,13, 70) ;
              insert into marks VALUES(1,14, 70) ;
               insert into marks VALUES(1,15, 70) ;
                insert into marks VALUES(1,16, 70) ;
                
                
            insert into marks VALUES(2,11, 70) ;
            insert into marks VALUES(2,12, 51) ;
             insert into marks VALUES(2,13, 30) ;
              insert into marks VALUES(2,14, 40) ;
               insert into marks VALUES(2,15, 60) ;
                insert into marks VALUES(2,16, 70) ;
                
                
                      
            insert into marks VALUES(3,11, 70) ;
            insert into marks VALUES(3,12, 20) ;
             insert into marks VALUES(3,13, 30) ;
              insert into marks VALUES(3,14, 40) ;
               insert into marks VALUES(3,15, 30) ;
                insert into marks VALUES(3,16, 70) ;
     
     
                       
            insert into marks VALUES(4,11, 70) ;
            insert into marks VALUES(4,12, 45) ;
             insert into marks VALUES(4,13, 30) ;
              insert into marks VALUES(4,14, 40) ;
               insert into marks VALUES(4,15, 10) ;
                insert into marks VALUES(4,16, 70) ;
                
                
             insert into marks VALUES(5,11, 90) ;
            insert into marks VALUES(5,12, 80) ;
             insert into marks VALUES(5,13, 100) ;
              insert into marks VALUES(5,14, 95) ;
               insert into marks VALUES(5,15, 97) ;
                insert into marks VALUES(5,16, 99) ;
                
             insert into marks VALUES(6,11, 90) ;
            insert into marks VALUES(6,12, 81) ;
             insert into marks VALUES(6,13, 85) ;
              insert into marks VALUES(6,14, 95) ;
               insert into marks VALUES(6,15, 97) ;
                insert into marks VALUES(6,16, 93) ;
      

select students.stid as ID,students.stname as Name,avg(marks.grades)as average,
status=
case
when  ( select count(marks.grades) from marks where marks.grades<50 and students.stid=marks.stid)= 0 THEN 'pass'
when  (select count(marks.grades) from marks where marks.grades<50 and students.stid=marks.stid) <= 3 THEN 'incomplete'
else 'fail'
End
from students INNER JOIN marks
on students.stid=marks.stid
group by marks.stid,students.stname,students.stid;

select top 3 students.stid as ID,students.stname as Name,avg(marks.grades)as average
from students INNER JOIN marks
on students.stid=marks.stid
group by marks.stid,students.stname,students.stid
having ((select count(marks.grades) from marks where marks.grades<50 and students.stid=marks.stid)= 0)
order by average desc;


