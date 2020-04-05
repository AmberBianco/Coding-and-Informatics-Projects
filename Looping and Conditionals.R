# R: Conditionals and Looping
# For this assignment you will complete exercises in The Book of R involving conditionals and
# looping, then use loops and conditionals to remove outliers from the gestation column of the
# babies dataset. (Note that many of the exercises have several parts).


# 1. Complete ex 10.1 b on p 185


# 2. Complete ex 10.2 b on p 191. Hint: when you create a new factor variable from an
# existing factor variable and need to drop unused levels, you can use:
# droplevels(doselevel)


# 3. Complete ex 10.4 c on p 204


# 4. Read file "babies_assign7.csv" into a dataframe named babies.
setwd("/Users/amber/OneDrive/Documents/631")

babies4 <- read.csv(file="babies_assign7.csv", header=T, na.strings="?")

# Fit a linear model, named fit1, of bwt as a function of gestation and smoke.
# Display a summary of fit1.
# Provide the equation of the fitted line for babies of non-smoking mothers
# Provide the equation of the fitted line for babies of smoking mothers
# Provide a value for fit1's goodness of fit. State which quantity in the summary it is
# Display Residuals vs Fitted plot for fit1
# Display a Residuals vs Leverage plot using the command plot(fit1,5)

# 5. Copy babies into a new dataframe named babies6. Use an ifelse statement to modify
# outliers in gestation to NA. (Consider an outlier to be a gestation value less than 220
# days or greater than 330 days. Do not use slice to modify outliers.


# 6. Fit a linear model, named fit6, of bwt as a function of gestation and smoke, using
# babies6.
# Display a summary of fit6.
# Provide the equation of the fitted line for babies of non-smoking mothers
# Provide the equation of the fitted line for babies of smoking mothers
# Provide a value for fit6's goodness of fit. State which quantity in the summary it is
# Display Residuals vs Fitted plot for fit6
# Display a Residuals vs Leverage plot using the command plot(fit6,5)


# 7. Copy babies into a new dataframe named babies7. Use a for loop to loop through
# babies7$gestation and modify outliers to NA. (Consider an outlier to be a gestation
# value less than 220 days or greater than 330 days. Place this statement within your for
# loop to modify the ith gestation value, if an outlier: babies7$gestation[i] = NA
# Hint: you can use a condition similar to: !(is.na vec[i]) && (vec[i]<val || vec[i] > val)


# 8. Copy babies into a new dataframe named babies8. Use a while loop to loop through
# babies7$gestation and modify outliers to NA. (Consider an outlier to be a gestation
# value less than 220 days or greater than 330 days. Place this statement within your for
# loop to modify the ith gestation value if an outlier: babies8$gestation[i] = NA
#  Hint: you can use a condition similar to: !(is.na vec[i]) && (vec[i]<val || vec[i] > val)


# 9. Use an apply function with each of these datasets to calculate the means of all of their
# columns: babies, babies6, babies7, and babies8. Be sure that your result is not NA

# 10. Use function all to verify that all corresponding values of babies7$gestation and
# babies6$gestation are equal.


# 11.Use function any to verify that there no corresponding values of babies7$gestation and
# babies8$gestation that are unequal. (ie: when you check if any are unequal, the result
# should be FALSE).