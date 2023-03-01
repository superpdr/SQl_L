create database sqlpractice;
use sqlpractice;
drop database sqlpractice;

#CREATE TABLE 

create table employee(
e_id int not null,
e_name varchar(30),
e_salary int,
e_age int,
e_dept varchar (20),
e_gender varchar (20),
primary key(e_id)
); ----------------------------------------------# creating table ssyntax ( column data types ) 

#INSERT VALUES 

insert into employee values(
1,'raj',40000,25,'sales','male'
); 

insert into employee values(
2,'manik',30000,22,'marketing','male'
);

insert into employee values (
3,'radhika', 75000, 24, 'analytics','female'
);

insert into employee values(
4,'vaibhav',45000,27,'sales','male'
); 

insert into employee values(
5,'banik',35000,26,'marketing','male'
);

insert into employee values (
6,'shyam', 65000, 26, 'analytics','male'
);

#SELECT COMMAND 

select e_name from employee;
select e_age from employee;   ----- #single column extraction 

select e_name ,e_age,e_dept from employee;  ------ #multiple column extraction 

select * from employee ; ---------------#extracting all the columns from table 

#SELECT DISTINCT 

select distinct e_dept from employee;    ----# gives only distincct values from column 

select e_dept from employee;             ------# gives all values from the columns 

# WHERE CLAUSE 

select e_name,e_age from employee where e_dept = 'SALES'; ------------------# filtering using where condition and the sql is not case sensitive for where condition 
select e_Name ,e_dept  from employee where e_SALARY  >30000 ;
select e_Name ,e_dept  from employee where e_SALARY  >50000; 


# MULTIPLE CLAUSES (AND,OR,NOT)
select * from employee where e_age < 26 and e_salary > 30000; -------------# and needs both condition tru 

select * from employee where e_age < 25 or e_dept = "sales"; ---------------# or operator 
-
#NOT OPERATOR 

select * from employee where not  e_dept = "sales";

#PATTERN FIND OPERATOR (LIKE ,BETWEEN) 

select * from employee where e_name  like 'ra%'; ---------------# like operator recognises pattern and gets the name of employees wirth ra ,% is wilcard character and single quotes is mandatory 

select * from employee where e_age like '2_';


select * from employee where e_age between 20 and 24;-------------# between operator for values between the range 



#BASIC FUNCTIONS(AGGREGATE ) 

select min(e_age) from employee; ----------------------------- # minimumm function from column 

select max(e_age) from employee ; ------------------------------# maximum function from column 

select count(*) from employee where e_dept = 'SALES' ; ----------------------- # count return no. of records matching criteria 
 
select count(*) from employee where e_dept = 'SALES' and e_age <30 ;

select sum(e_salary) from employee; ------------------# returns sum of the column value 

select avg(e_age) from employee ;   ------------------# returns average value of column entries 


#BASIC FUNCTION(STRING)

select '         Piyush' ;---------------------------# creating a string 
select ltrim('         Piyush') ; ------------------------# using lsft trim to remove the left spaces 

select ' THIS IS SQL PRACTICE';
SELECT LOWER(' THIS IS SQL PRACTICE'); -----------------------## lower case conversion of the string 

select 'this is sql practice ';
select upper('this is sql practice '); ----------------------# upper case conversion of string 

select reverse('this is sql practice '); ---------------------# reversing the string 

select substring('this is sql practice ',1,10);---------------------# sub string of slicing the string through index , **** SQL STRINGS HAVE INDEX FROM  1 AND NO NEGATIVE INDEX 


#BASIC FUNCTION(SORTING(order by, top )  )

select * from employee order by e_salary; ---------------------------# sorting in defaul;t ascending 

select * from employee order by e_salary desc; ------------------------# sorting in descending order 

select e_name from employee order by e_salary ;

SELECT * from employee limit 3  ; ------------------# top command syntax in mysql needs to work around with select all with limit 

select * from employee order by e_age desc limit 3;   -------------  # top most aged employee 


#BASIC FUNCTIONS (SORTING (group by )

select avg(e_salary),e_dept from employee group by e_dept;  ---------------#group by is used to create the group in data 

select avg(e_age) ,e_dept from employee group by e_dept  order by avg(e_age) desc; ------------# mixxing the conditionalitiues to get the result 


select e_dept ,avg(e_salary) as avg_salary 
from employee
group by e_dept
having avg_salary <50000
order by avg_salary desc ; ---------------------# Having clause is used in group by to filter some condition in viewing and is always used after group by and before orderby alter

#MDATA MANIPULATION LANGUANGE (Alter, update,delete,truncate)

----------#ALTER TABLE #------------
alter table employee
add e_dob date; ---------------------------# altering table by adding ther columnn and we gice the datatype 

alter table employee 
drop column e_dob ; ------------------------# dropping the column from table 

select * from employee ;


update employee set e_age =31 where (e_name ='raj' and e_id =1); ------------------#update is data manipulation so it willl ask for primary key in where condition or else will throw error 

set sql_safe_updates = 0;
update employee set e_age = 30 where e_name = 'raj';
set sql_safe_updates =1; ------------------------------------# this is another method to by pass the pimaruy key ,set safe updates to 0 and update and then again set safe updates to 1 


update employee set e_dept = 'tech' where( e_dept = 'analytics' and e_id <> 0 ); ------------#geniuus is when it is for more than one primary key cant be specified then we primary key is not equal to 0 male' where e_id = 3


delete from employee where (e_name = 'shyam' and e_id <> 0 ); ---------------#delete statement and it also requires the primary keys in the use because we are manipulating the data alter

truncate table employee; ------------ #truncate deletes all the data in the table but keeps the structure of the table intact . delete tablle deletes all the data with structure 


#DATAM ANIPULATION (JOINS) 

create table department (
d_id int not null ,
d_name varchar(30),
d_location varchar(30)
);                                        ------------------#we are creatingf new table to learn the joins 

insert into department values (
1,'sales','pune');

insert into department values (
2,'marketing','chennai');

insert into department values (
3,'marketing','mumbai');

insert into department values (
4,'tech','banglore');
insert into department values (
5,'sales','banglore'); -------------------------------------------#inserted the 5 values in the new table 

#inner join  on department as it is common 

select employee.e_name , employee.e_dept ,department.d_name,department.d_location
from employee
inner join department  on  employee.e_dept = department.d_name; ----------------------------#inner join syntax  , we specify what columns we want and then join two with condition 


select employee.e_name , employee.e_dept , department.d_name , department.d_location 
from employee 
left join department on employee.e_id = department.d_id;------------------------- # left join syntax , from is the left side table and whereve there is no match values a null will appear



select employee.e_name , employee.e_dept , department.d_name , department.d_location 
from employee 
right join department on employee.e_id = department.d_id; ----------------------#right join ,fromis the right table and null values iof values are not present 

select employee.e_name , employee.e_dept , department.d_name , department.d_location
from employee 
full join department on employee.e_dept = department.d_name; ------------------------# full outer join , **** always error message when it is finding the columns in field list (help this with trainer ) 

select employee.e_name , employee.e_dept ,department.d_name,department.d_location
from employee
join department  on  employee.e_dept = department.d_name; ------------------------------# join is default left join 


select student_1.s_id ,student_1.s_name , student_1.s_marks
from student_1 
inner  join student_2 on student_1.s_id = student_2.s_id ;

select student_1.s_id ,student_1.s_name , student_1.s_marks
from student_1 
left  join student_2 on student_1.s_id = student_2.s_id ;

select student_1.s_id ,student_1.s_name , student_1.s_marks
from student_1 
right join student_2 on student_1.s_id = student_2.s_id ;

select student_1.s_id ,student_1.s_name , student_1.s_marks
from student_1 
full  join student_2 on student_1.s_id = student_2.s_id ;

select student_1.s_id ,student_1.s_name , student_1.s_marks,student_2.s_id ,student_2.s_name , student_2.s_marks
from student_1 
left  join student_2 on student_1.s_id = student_2.s_id 
union 
select student_1.s_id ,student_1.s_name , student_1.s_marks,student_2.s_id ,student_2.s_name , student_2.s_marks
from student_1 
right join student_2 on student_1.s_id = student_2.s_id;------------------------# full join is not in mysql , *** thats union of left join and right join is done 



#UPDATING TABLES USING JOINS 
update employee
join department on employee.e_dept = department.d_name
set e_age = e_age +10 
where (d_location = 'banglore' and e_id <>0) ; ------------------------# update after joining the table , this is used for getting combiuned updated result 

#DELETE RECORDS AFTER JOINS
set sql_safe_updates = 0;

delete employee
from employee 
join department on employee.e_dept = department.d_name 
where d_location = 'banglore';

set sql_safe_updates = 1; ------------------------------------------------# delete records after join , we set sql safwe updates on and off before and after execution 



#DATA MANIPULATION (Union, Except ,Intersect  operators )

------# cloning of the tables 
create table student_1 (
s_id int,
s_name varchar(20),
s_marks int 
);
insert into student_1 values (1,'a',25);

create table student_2 select * from student_1; ------------------ #simple clone ----> copy of the table without the column attributes and index but it will have structure and data 
select* from  student_2;

create table student_3 like student_1 ; ---------------------# shallow clone  ------> copy of the with column attributes and index but it will jhave no data 
select * from student_3 ;

create table student_4 like student_1; ----------------------------# deep clone -------> copy with the column sattributes and indexes with the data of original column 
insert into student_4  select* from student_1;
select * from student_4;

-------------#union and union all operator
 
insert into student_2 values (5,'e',36);

set sql_safe_updates =0;
delete from student_2 where s_id = 1;
set sql_safe_updates =1; ----------------------#   delete record => delete from table where ..... if where not mentioned then entire table gets deleted 

select * from student_1 
union 
select * from student_2; ------------------------# union gives without duplicates 


select * from student_1 
union all 
select * from student_2; ---------------------# union all gves with duplicates 


------------#Except operator  ===  left excluding join or right excluding join  


-------#intersect operator=== like the inner join in the mysql 

#VIEWS 
create view female_emp as
select * from employee
where e_gender = 'female'; ----------------#creating the view for specific observation from entire data 

select* from female_emp; ----------------# viewing the view 

drop view female_emp; ------------------# dropping the view 


# MERGE STATEMENT 
create table employee1 like employee;
insert into employee1 select * from employee;
select* from employee1; 
set sql_safe_updates =1; 
delete from employee1 where ( e_id =4);
update employee1 set e_salary = 45000 where e_id =1;

------# merge === source is employee and target is employee1 
	 # merge is not supporterd in my sql 
     
#FUNCTIONS

---------# procedure 
DELIMITER $$
create procedure add_five1(in num int ) 
begin
	select num + 5  ;
END $$
delimiter;
------------# function 
DELIMITER $$
CREATE FUNCTION `add_five1`(num int )
RETURNS int 
deterministic
BEGIN
RETURN 
	num +5 ;
END  $$

#CASE STATEMENT 
select 
case 
when 10>20 then ' 10 is greater 20'
when 10 < 20 then  '10 is less than 20 '
else '10 is equal to 20'
end ;   ----------------#  case statement in the Mysql 

select *,
case 
when e_salary >60000 then 'A'
when e_salary >50000 then 'B'
when e_salary > 40000 then 'C'
else 'D'
end  as grade 
from employee; ------------------# case statement and returning new column on conditions of hierarchical conditionalities 

# IIF () FUNCTION 
select 
if(10>20 ,'10 is greater','10 is lesser' )
;

select *,(
if(e_age>25 ,'old ','young')) as employeegen
from employee;



