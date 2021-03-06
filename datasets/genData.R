###############################################################
# Script to generate datasets for Bayes workshop at MCLS 2019
# written by Tom Faulkenberry, 6/12/2019
################################################################

##########################################################
# Dataset 1 - decomposed processing of two-digit numbers
# e.g., Verguts & De Moor (2005)

# participants reported in paper
N = 43
n1 = 23   # choose smaller condition
n2 = N-n1 # choose larger condition

# randomly generate distance effects
condition = c(rep("smaller", n1),rep("larger",n2))
distSame = rnorm(N, mean=-40, sd=50)
distDifferent = rnorm(N, mean=1, sd=8)

t.test(distSame, mu=0)
t.test(distDifferent, mu=0)

dat = data.frame(condition,distSame,distDifferent)

write.csv(dat, file="~/Desktop/ttest.csv")


# Datset 2 -  regress symbolic and nonsymbolic NDE onto math fluency 
# (e.g., Holloway & Ansari, 2006)

# parameters from paper
betaSymbolic = -0.236 
betaNonsymbolic = 0.063
r = 0.151
N = 86

# these parameters are best guesses from Figure 1
# for simplicity, let's assume the distribution parameters 
# for symbolic and nonsymbolic DEs do not differ
meanDE = 0.2 
sdDE = 0.15
meanFluency = 105
sdFluency = 20

# convert reported beta into a regression slope
slopeSymbolic = betaSymbolic*sdFluency/sdDE
slopeNonsymbolic = betaNonsymbolic*sdFluency/sdDE

# generate symbolic and nonsymbolic DEs with correct correlation
symbolicDE = rnorm(n=N, mean = meanDE, sd=sdDE)
nonsymbolic = rnorm(n=N, mean = meanDE, sd=sdDE)
nonsymbolicDE = symbolicDE*r + nonsymbolic*(1-r^2)
cor(symbolicDE, nonsymbolicDE) # check correlation..should be close to reported r

# generate data from regression model (with added noise)
fluency = slopeSymbolic*(symbolicDE-meanDE) + slopeNonsymbolic*(nonsymbolicDE-meanDE) + meanFluency + rnorm(n=N, mean=0, sd=15)

# collect into data frame and check regression model
dat = data.frame(round(symbolicDE,3), round(nonsymbolicDE,3), round(fluency,0))
names(dat) = c("symbolicDE", "nonsymbolicDE", "fluency")
plot(dat$symbolicDE, dat$fluency)
abline(lm(fluency~symbolicDE, data=dat))
summary(lm(fluency~symbolicDE+nonsymbolicDE))

# if data looks good, write to CSV for future analysis in JASP
write.csv(dat, file="~/Desktop/MCLSworkshopData/regression.csv")

# Dataset 3 - size x format interaction in mental arithmetic
# e.g., Campbell & Fugelsang (2001)

# reported N from original paper
N = 48

# estimates from Campbell & Fugelsang 
intercept = 1069; interceptSD = 150
sizeBeta = 262; sizeSD = 200
formatBeta = 477; formatSD = 200
intBeta = 212; intSD = 300

# random effects
intercepts = rnorm(n=N, mean=intercept, sd=interceptSD)
size = rnorm(n=N, mean=sizeBeta, sd=sizeSD)
format = rnorm(n=N, mean=formatBeta, sd=formatSD)
int = rnorm(n=N, mean=intBeta, sd=intSD)

# generate data
cond1 = intercepts                          # small, digit
cond2 = intercepts + size                   # large, digit
cond3 = intercepts + format                 # small, word
cond4 = intercepts + size + format + int    # large, word

subject = seq(1,N)
small.digit = round(cond1)
large.digit = round(cond2)
small.word = round(cond3)
large.word = round(cond4)
dat = data.frame(subject, small.digit, large.digit, small.word, large.word)
write.csv(dat, "~/Desktop/anovaData.csv")
