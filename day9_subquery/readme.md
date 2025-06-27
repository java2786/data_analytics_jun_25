# Subquery
### Database is used from previous session

## Find records from all the tables
- name from Students
- marks from Scores
- sub from Subjects

Subject table -> math -> subject_id => Scores table -> score, std_id using sub_id => Student table -> roll

Find all students who scored highest marks in any subject.

```sql
select max(marks) from Scores where sub_id=(select id from Subjects where name = 'Math');

select name from Students where roll in (select student_id from Scores where marks = (select max(marks) from Scores where sub_id=(select id from Subjects where name = 'Math')));

```


## Show name and marks

```sql
select name as student_name, (select marks from Scores where Students.roll = student_id and sub_id=(select id from Subjects where name = 'Math')) as Marks, (select name from Subjects where name = 'Math') as subject_name from Students;
```

## Using Join
```sql
select Students.name, Scores.marks from Students
left join Scores
on Scores.student_id = Students.roll and Scores.sub_id=2;
```



## Problems to practice

