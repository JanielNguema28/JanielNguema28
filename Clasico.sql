select *
from La_liga

select season, Date, HomeTeam, AwayTeam, FTHG, FTAG, iif (FTHG > FTAG, 'HomeTeam Win', iif (FTAG > FTHG, 'AwayTeam Win', 'Draw')) as Winner
from La_liga

-- the number of clasico over the years in la Liga
--number of time barca won 
--number of time madrid won
--number of draw

-- the number classico total in la liga
select 
(select count(FTR) as BarcaHomeGame
from
(select FTR from La_liga where HomeTeam = 'Barcelona' and AwayTeam = 'Real Madrid')
Result)
+
(select count(FTR) as RealHomeGame
from
(select FTR from La_liga where HomeTeam = 'Real Madrid' and AwayTeam = 'Barcelona')
Result) 
as Total_Classico_Played


--Number of time Barca Won
select
(select count (FTR) as BarcaHomeWin
from
(select FTR from La_liga where HomeTeam = 'Barcelona' and AwayTeam = 'Real Madrid')
Result
where FTR = 'H')
+
(select count(FTR) as BarcaAwayWin
from
(select FTR from La_liga where HomeTeam = 'Real Madrid' and AwayTeam = 'Barcelona')
Result
where FTR = 'A')
as TotalBarcaWin


--Number of time Madrid won

select
(select count (FTR) as RealAwayWin
from
(select FTR from La_liga where HomeTeam = 'Barcelona' and AwayTeam = 'Real Madrid')
Result
where FTR = 'A')
+
(select count(FTR) as RealHomeWin
from
(select FTR from La_liga where HomeTeam = 'Real Madrid' and AwayTeam = 'Barcelona')
Result
where FTR = 'H')
as TotalRealWin


--Numbwer of Draws
select
(Select count( FTR ) as CampNouDraw
from
(select FTR from La_liga where HomeTeam = 'Barcelona' and AwayTeam = 'Real Madrid')
Result
where FTR = 'D')
+
(Select count( FTR ) as BernabeuDraw
from
(select FTR from La_liga where HomeTeam = 'Real Madrid' and AwayTeam = 'Barcelona')
Result
where FTR = 'D')
as TotalClasicoDraw

