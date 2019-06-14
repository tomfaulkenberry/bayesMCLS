# Workshop on Bayesian Statistics in Numerical Cognition

This repository contains materials for my workshop on Bayesian Statistics in Numerical Cognition, held at [MCLS 2019](https://www.the-mcls.org/) in Ottawa, ON. 

## Materials
- Workshop slides (coming soon!)
- [JASP software](http://jasp-stats.org)

## Data sets 
Each of the datasets below is formatted in CSV (comma separated value) format, which is the format required for JASP. You will want to download the files somewhere on your computer. Windows users should "right-click" on the CSV link. Mac users should "ctrl+click" on the CSV link. Alternatively, you can download a single ZIP archive of the files [here](https://raw.githubusercontent.com/tomfaulkenberry/bayesMCLS/master/datasets.zip).

*Note*: all datasets below are simulated and should be used for instruction only. Each dataset was generated in R and to the best extent possible reflects the structure of the data reported in the accompanying paper. The R script for generating these datasets is [here](datasets/genData.R).

- *t-test example* ([csv](https://raw.githubusercontent.com/tomfaulkenberry/bayesMCLS/master/datasets/ttest.csv))
  - these data are based on [Verguts and De Moor (2005)](https://dx.doi.org/10.1027/1618-3169.52.3.195), who tested decomposed versus holistic processing in two-digit number comparison. The variables in this dataset include:
    - `condition`: participants were randomly assigned to choose either the "smaller" or "larger" of each number pair.
	- `distSame`: a measure of distance effect for same-decade pairs (e.g., 52 vs. 58). Specifically, it is defined as the mean RT difference (ms) between "close" pairs (i.e., numerical distance 1 to 4) and "far" pairs (i.e., numerical distance 5-8).
	- `distDifferent`: a measure of distance effect for different-decade pairs (e.g., 68 vs. 73)
  
- *regression example* ([csv](https://raw.githubusercontent.com/tomfaulkenberry/bayesMCLS/master/datasets/regression.csv))
  - these data are based on [Holloway and Ansari (2009)](https://dx.doi.org/10.1016/j.jecp.2008.04.001), who studied the relationship between symbolic and nonsymbolic distance effects and mathematical fluency. The variables in this dataset include:
    - `symbolicDE`: a standardized measure of distance effect for symbolic number comparison, defined as (close RT - far RT)/(closeRT)
	- `nonsymbolicDE`: a standardized measure of distance effect for nonsymbolic comparison, defined as above
	- `fluency`: a measure of math fluency from Woodcock-Johnson III (timed math facts for 3 minutes)

- *factorial ANOVA example* ([csv](https://raw.githubusercontent.com/tomfaulkenberry/bayesMCLS/master/datasets/anova.csv))
  - these data are based on a replication of [Campbell and Fugelsang (2001)](https://dx.doi.org/10.1016/S0010-0277(01)00115-9), who found an interaction between problem size and format in mental addition verification. The variables in this dataset include:
    - `subject`: this is a within-subjects design, so `subject` number will be a random effects term.
	- `size`: problems were either "small" (product less than or equal to 25) or "large" (product greater than 25)
	- `format`: problems were presented in either "digit" or "word" format
	- `rt`: collapsed (mean) RT across all problems for each combination of subject, size, and format.


