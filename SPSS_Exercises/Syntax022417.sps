* Encoding: UTF-8.
*
*
*
*Using Email data set.
*
*
*.

*Can add comments to syntax files by adding a "*" at the beginning of a line.  End coments with a period.

*I like to add lots of comments to my syntax files, because I have a bad memory of what I did or why I did it.

*using pulldown menus and "pasting" the syntax here might produce this line:
*DATASET ACTIVATE DataSet1.
*I usually delete that line or comment it out like below in the aggregation code.

*Good practices include: only have one SPSS data fiile open at a time when you are using syntax files.  SPSS can get confused about
*what data file the syntax refers to.


*
*Analysis.
*.


*Creating an aggregation, which will create a new data set.
*change file path if you run this...
*DATASET ACTIVATE DataSet1.
AGGREGATE
  /OUTFILE='/Users/mfranz/Downloads/aggrbyyear.sav'
  /BREAK=Year
  /Sent_sum=SUM(Sent).


*sort data on date.
SORT CASES BY Date(A).

*recoding days of week into numbers.
RECODE Day ('Mon'=1) ('Tue'=2) ('Wed'=3) ('Thu'=4) ('Sat'=6) ('Fri'=5) ('Sun'=7) INTO Daynumb.
EXECUTE.


*creating a table (crosstab) of days by year.
*why would I create this table?.
CROSSTABS
  /TABLES=Day BY Year
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

*rerun with column percents added.
CROSSTABS
  /TABLES=Day BY Year
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.



***************************************************************************************.

*
*
*
*Using 2016 Polar poll.
*
*
*.

*Running descriptive stats on Q8.
 *DATASET ACTIVATE DataSet2.
DESCRIPTIVES VARIABLES=Q8_1 Q8_2 Q8_6 Q8_9 Q8_11 Q8_12
  /STATISTICS=MEAN STDDEV MIN MAX.

*Note that this file has data labels which help a bit with reading the output, but in working with a survey, it is helpful also to have
*the survey codebook handy to know what each question's wording is.


