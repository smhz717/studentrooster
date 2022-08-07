select * 
from Student_rooster.dbo.['1-ROSTER-Roster$']

--finding number of schools in each district
select [District Name],COUNT(distinct ([school Emis Code])) as Number_of_schools 
from Student_rooster.dbo.['1-ROSTER-Roster$']
Group BY [District Name]
ORDER BY Number_of_schools 

--number of urban/rural schools
select [Urban Rural],COUNT(distinct ([school Emis Code])) as Number_of_schools  
from Student_rooster.dbo.['1-ROSTER-Roster$']
Group BY [Urban Rural]

--breakdown of rural schools in each district 
select [District Name],COUNT(distinct ([school Emis Code])) as Number_of_schools  
from Student_rooster.dbo.['1-ROSTER-Roster$']
where [Urban Rural] = 'Rural'
Group BY [District Name]

--breakdown of urban schools in each district 
select [District Name],COUNT(distinct ([school Emis Code])) as Number_of_schools  
from Student_rooster.dbo.['1-ROSTER-Roster$']
where [Urban Rural] = 'Urban'
Group BY [District Name]

--number of boys school in each district
select [District Name],COUNT(distinct ([school Emis Code])) as Number_of_boys_schools  
from Student_rooster.dbo.['1-ROSTER-Roster$']
where [School_Type] = 'Boys'
Group BY [District Name]

--number of girls school in each district
select [District Name],COUNT(distinct ([school Emis Code])) as Number_of_girls_schools  
from Student_rooster.dbo.['1-ROSTER-Roster$']
where [School_Type] = 'Girls'
Group BY [District Name]

--number of co-ed school in each district
select [District Name],COUNT(distinct ([school Emis Code])) as Number_of_boys_schools  
from Student_rooster.dbo.['1-ROSTER-Roster$']
where [School_Type] = 'Co_Education'
Group BY [District Name]

--breakdown of Male and female students
select Gender_Child, COUNT(Gender_Child) as Number_of_children  
from Student_rooster.dbo.['1-ROSTER-Roster$']
Group BY Gender_Child

--breakdown of Male and female students in co-ed schools
select Gender_Child, COUNT(Gender_Child) as Number_of_children  
from Student_rooster.dbo.['1-ROSTER-Roster$']
Where School_Type = 'Co_Education'
Group BY Gender_Child

--Average female students per school in each district in co-ed schools
select [District Name], COUNT(Gender_Child) as Number_of_children, COUNT(distinct([school Emis Code])) as Number_of_schools, COUNT(Gender_Child)/COUNT(distinct([school Emis Code])) AS Average_Girls_per_school 
from Student_rooster.dbo.['1-ROSTER-Roster$']
Where School_Type = 'Co_Education' AND Gender_Child = 'Female'
Group BY [District Name]

--Average female students per school in each district in co-ed schools
select [District Name], COUNT(Gender_Child) as Number_of_children, COUNT(distinct([school Emis Code])) as Number_of_schools, COUNT(Gender_Child)/COUNT(distinct([school Emis Code])) AS Average_Boys_per_school 
from Student_rooster.dbo.['1-ROSTER-Roster$']
Where School_Type = 'Co_Education' AND Gender_Child = 'Male'
Group BY [District Name]

--age distribution by grade
select AGE, COUNT((Age)) AS NUMBER_OF_STUDENTS, Current_Grade
from Student_rooster.dbo.['1-ROSTER-Roster$']
GROUP BY Current_Grade, AGE
ORDER BY AGE

--Number of children still attending


select  COUNT([Is the child currently attending this school?])
from Student_rooster.dbo.['1-ROSTER-Roster$']
WHERE [Is the child currently attending this school?] = 'Yes'



