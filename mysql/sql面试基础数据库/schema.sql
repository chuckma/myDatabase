CREATE TABLE student 
  ( 
     s_id    INT, 
     sname varchar(32), 
     sage  INT, 
     ssex  varchar(8) 
  ) 

CREATE TABLE course 
  ( 
     c_id    INT, 
     cname varchar(32), 
     t_id    INT 
  ) 

CREATE TABLE sc 
  ( 
     s_id    INT, 
     c_id    INT, 
     score INT 
  ) 

CREATE TABLE teacher 
  ( 
     t_id    INT, 
     tname varchar(16) 
  )