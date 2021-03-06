# bowlingResults
2018-2019 bowling results analytics

A project to analyze my bowling teams scores across the 2018-2019 season.
The purpose of this project is to see if there is any way to use statistics to improve bowling scores
The analytics will be run R, using hypothesis testing to see if there are any statistical differences between scores
Datasets are ~30 rows of scores, separated by game, dates, series, YTD pins and YTD games
I'm not confident that I will find anything interesting, but I figured I should try!


Plots each game and series for 3 bowlers with rolling average since the linear regression model gave a terrible fit.
Plots histograms, and dot plots for each game for a quick outlier check. 
Checks normality by shapiro-wilks. Bowler #2 had a non-normal set of data so we'll use parametric tests.

Performs wilcoxon test on each bowler's own game/series data, and compares games/series between bowlers to see if there is enough evidence to show that they are from different sets of data (in other words, whether one bowler is better or worse than another). 

Code could be optimized, but with only 3 sets of score, it's easy enough to copy and paste to reuse code. Updating pieces is kind of a pain when making changes, but since they're all lumped together it isn't as bad as it could be.

Some sort of predictive analysis could be performed to see if the distributions will match in the future. A Time Series Analysis may be appropriate. Not sure if there's enough data to train LSTM or RNN

Note, one bowler missed the first week and had blind scores. 
Clearly this isn't reflective of their ability so that week was removed for bowler #2 scores. This must be remembered when picking files when inputting data.

Bowler #1 has a statistically significant difference in bowling scores when compared to the other bowlers. 
A few outliers exist for each bowler by checking the Boxplots. 
Moving average data seems to be more interesting and descriptive than lineare regression. It shows slight improvement over the course of the season, and where scores dipped or increased over intervals. 

I'll add more data and change up the analysis when I have scores for next year.
