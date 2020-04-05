# Functions:

# Simulate a vector of n values randomly drawn from a normal distribution
#  having a mean of pop_mean, and standard deviation of pop_stdDev
# Display a histogram, summary statistics and return the vector
simulate_height <- function(n, pop_mean, pop_stdDev){
   height<- rnorm(n, pop_mean, pop_stdDev) # inches
   hist(height, breaks = 40)
   print(summary(height))
   height # returned value
}

# Display the confidence interval of the mean of a normal distribution 
#  or of a sample having n>=30 even if not normal (Central Limit Theorem).
# Uncomment print to display intermediate values of the calculation
CI_of_mean <- function(sample_mean, sample_sd, n, confidence){
  SEM<- sample_sd/sqrt(n)
  alpha <- 1 - confidence
  critical_val <- qnorm(1-alpha/2)
  term <- SEM * critical_val
  #print (paste(alpha, sample_mean,SEM, critical_val, term))
  cat(confidence*100,"%: ", sample_mean-term,"-", sample_mean+term )
}


set.seed(101)
# We simulate heights of 10000 men in the US
height_men_10000 <- simulate_height(10000, 69, 3) # inches

# We simulate heights of 10000 12-yr-old boys in the US
height_boys_10000 <- simulate_height(10000, 58, 3) # inches

# The combined distribution
height_10000 <- c(height_men_10000,height_boys_10000)
hist(height_10000, breaks = 40)
summary(height_10000)


# Call function CI_of_mean to calculate the .90, .95, and .99 CIs of mean
#  for each of the three height vectors (boys, men, combined) where n=10000
CI_90pct_height_boys_10000 <- CI_of_mean(mean(height_boys_10000),
                    sd(height_boys_10000), 10000, 0.90)
CI_95pct_height_boys_10000 <- CI_of_mean(mean(height_boys_10000),
                    sd(height_boys_10000), 10000, 0.95)
CI_99pct_height_boys_10000 <- CI_of_mean(mean(height_boys_10000),
                    sd(height_boys_10000), 10000, 0.99)

#Men
CI_90pct_height_men_10000 <- CI_of_mean(mean(height_men_10000),
                                         sd(height_men_10000), 10000, 0.90)
CI_95pct_height_men_10000 <- CI_of_mean(mean(height_men_10000),
                                         sd(height_men_10000), 10000, 0.95)
CI_99pct_height_men_10000 <- CI_of_mean(mean(height_men_10000),
                                         sd(height_men_10000), 10000, 0.99)                         


# combined
CI_90pct_height_10000 <- CI_of_mean(mean(height_10000),
                                         sd(height_10000), 20000, 0.90)
CI_95pct_height_10000 <- CI_of_mean(mean(height_10000),
                                         sd(height_10000), 20000, 0.95)
CI_99pct_height_10000 <- CI_of_mean(mean(height_10000),
                                         sd(height_10000), 20000, 0.99)
  
  
# Q1: What do you observe in the CI as the level of confidence
#  increases from .90 to .95 to .99?
#The CI gets wider as level of confidence increases


set.seed(101)
# Call function simulate_height to simulate heights of 40 men in the US
#  using the same mean and standard deviaitons before
height_men_40 <- simulate_height(40, 69, 3) 

# Call function simulate_height to simulate heights of 40 boys in the US
#  using the same mean and standard deviaitons before
height_boys_40 <- simulate_height(40,58,3)

# The combined distribution
height_40 <- c(height_men_40, height_boys_40)
hist(height_40, breaks = 40)
summary(height_40)

# Call function CI_of_mean to calculate the .90, .95, and .99 CIs of mean
#  for each of the three height vectors (boys, men, combined) where n=40
 # boys
CI_90pct_height_boys_40 <- CI_of_mean(mean(height_boys_40),
                                         sd(height_boys_40), 40, 0.90)
CI_95pct_height_boys_40<- CI_of_mean(mean(height_boys_40),
                                         sd(height_boys_40), 40, 0.95)
CI_99pct_height_boys_40 <- CI_of_mean(mean(height_boys_40),
                                         sd(height_boys_40), 40, 0.99)

 # men
CI_90pct_height_men_40 <- CI_of_mean(mean(height_men_40),
                                        sd(height_men_40), 40, 0.90)
CI_95pct_height_men_40 <- CI_of_mean(mean(height_men_40),
                                        sd(height_men_40), 40, 0.95)
CI_99pct_height_men_40 <- CI_of_mean(mean(height_men_40),
                                        sd(height_men_40), 10, 0.99) 
  
# combined
CI_90pct_height_40 <- CI_of_mean(mean(height_40),
                                    sd(height_40), 80, 0.90)
CI_95pct_height_40 <- CI_of_mean(mean(height_40),
                                    sd(height_40), 80, 0.95)
CI_99pct_height_40 <- CI_of_mean(mean(height_40),
                                    sd(height_40), 80, 0.99)
  
  
# Q2: What do you observe in the CI as the sample size
#  increases from 40 to 10,000?
#The CI gets smaller with increased sample size


# Call function simulate_height, passing arguements to simulate
#  a vector of 10000 men drawn from a population with the same mean
#  as previously, but this time with standard deviation of 1
height_men_10000_1 <- simulate_height(10000,69,1)


  
# Call function CI_of_mean to calculate the .90, .95, and .99 CIs
#  of the mean of height_men_10000_1.
# Compare these 3 CIs to those of the mean of the original men's height with SD=3
CI_90pct_height_men_10000_1 <- CI_of_mean(mean(height_men_10000_1),
                                     sd(height_men_10000_1), 10000, 0.90)
CI_95pct_height_men_10000_1 <- CI_of_mean(mean(height_men_10000_1),
                                     sd(height_men_10000_1), 10000, 0.95)
CI_99pct_height_men_10000_1 <- CI_of_mean(mean(height_men_10000_1),
                                     sd(height_men_10000_1), 10000, 0.99) 


  
# Q3: What do you observe in the CI as the standard deviation
#  of the sample increases from 1 to 3?
#The CI gets wider as the SD increases
  
  
# Q4: Name 4 values that the confidence interval of the mean is calculated from.
# You may find this answer either in Motulsky ch 10 or by examining 
# function CI_of_mean above
#1 Sample mean
#2 Confience level
#3.Sample Size
#4 Sample Standard Deviation


