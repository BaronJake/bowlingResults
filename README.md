# bowlingResults
2018-2019 bowling results analytics

A project to analyze my bowling teams scores across the 2018-2019 season.
The purpose of this project is to see if there is any way to use statistics to improve bowling scores
The analytics will be run R, using hypothesis testing to see if there are any statistical differences between scores
Datasets are ~30 rows of scores, separated by game, dates, series, YTD pins and YTD games
I'm not confident that I will find anything interesting, but I figured I should try!


Plots each game and series for 3 bowlers with rolling average since the linear regression model gave a terrible fit. P
lots histograms, and dot plots for each game for a quick outlier check. 
Checks normality by shapiro-wilks. 
Performs wilcoxon test on each bowler's own game/series data, and compares games/series between bowlers to see if there is enough evidence to show that they are from different sets of data (in other words, whether one bowler is better or worse than another). 
Code could be optimized, and some sort of predictive analysis could be performed to see if the distributions will match in the future, but for now it does what I wanted it to for now. 
Note, one bowler missed the first week and had blind scores. 
Clearly this isn't reflective of their ability so that week was removed for bowler #2 scores (Bowler S). This must be remembered when picking files when inputting data.

1 bowler (bowler J dataset) has a statistically significant difference in bowling scores when compared to the other bowlers. 
A few outliers exist for each bowler by checking the Boxplots. 
Moving average data is interesting and shows slight improvement over the course of the season, and where scores dipped or increased over intervals. 
