## If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
#The sum of these multiples is 23. In the src folder there is a script named lab2.R. 
#In that script finish the function solution so that it returns the sum of all the multiples of 3 or 5 
#below the number passed in. Note: If the number is a multiple of both 3 and 5, only count it once.

#Problem: 1
# get the multiples of 3 or 5 for the number
#add them
solution<-function(number){
  sum((1:number-1)[((1:number-1)%%3 == 0) | ((1:number-1)%%5 == 0)])
}
#solution(10)


 ## Problem: 2 
waitMonths <- function(priceOld, priceNew, saving, loss){
  month_count=0
 
  needed_piano_money= priceOld-priceNew
  if(priceOld > priceNew){  
    return(c(0, round(needed_piano_money)))
  }
  else if (needed_piano_money < 0){ 
    while(needed_piano_money < 0){
      month_count= month_count +1
      if(month_count==1){
        percent_loss<-(1-loss/100)
        priceNew <- priceNew * percent_loss
        priceOld <- priceOld * percent_loss
        savings<- saving
        needed_piano_money= priceOld- priceNew +savings
      }
      else if (month_count > 1 && month_count %% 2 == 0){
        loss=loss+ 0.5
        percent_loss<-(1-loss/100)
        priceNew <- priceNew * percent_loss
        priceOld <- priceOld * percent_loss
        savings<- saving + savings
        needed_piano_money <- priceOld - priceNew + savings
      }else if(month_count > 1 && month_count %% 2 !=0){
        percent_loss<-(1-loss/100)
        priceNew <- priceNew * percent_loss
        priceOld <- priceOld * percent_loss
        savings<- saving+ savings
        needed_piano_money <- priceOld - priceNew + savings
      }
    }
    return(c(round(month_count),round(needed_piano_money))) 
  }
}    

#waitMonths(2000,8000,1000,1.5)
waitMonths(2000, 8000, 1000, 1.5)
waitMonths(12000, 8000, 1000, 1.5)
waitMonths(8000, 12000, 500, 1.0)

## Problem: 3
#Check to see if a string has the same amount of 'x's and 'o's. 
#The method must return a boolean and be case insensitive. 
#The string can contain any char. 
  #count the number of x's and o's
  #do # of xs = os

xo <- function(s){
  my_string<-tolower(unlist(strsplit(s, "")))
  o_counter<- 0
  x_counter<-0
  for (i in 1:length(my_string)){
    if(my_string[i]=="o"){
      o_counter=o_counter+1  
    }
    else if(my_string[i]=="x"){
      x_counter= x_counter+1
    }
  }
  if (o_counter==x_counter){
    return(T)
  }else{
    return(F) 
  }
}
#s="xxoo"
#xo(s)  

## Problem: 4
#Given a string of words, return the length of the shortest word(s). 
#The string will never be empty and you do not need to account for different data types.
find_short <- function(s){
  split_string<-strsplit(s, " ")
  split_string <-unlist(split_string)
  shortest <- nchar(split_string[1])
  #print(split_string[1])
  for(i in 1:length(split_string)){
    if( nchar(split_string[i]) < shortest) {
      shortest <- nchar(split_string[i])
    } 
  }
  return(shortest)
} 



#find_short("bitcoin take over the world maybe who knows perhaps")
## Problem: 5
# A pangram is a sentence that contains every single letter of the alphabet at least once.
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram,
# because it uses the letters A-Z at least once (case is irrelevant). Given a string, 
# detect whether or not it is a pangram.
# Return True if it is, False if not. Ignore numbers and punctuation. 
is_pangram <- function(s){
  my_letters <- tolower(unlist(strsplit(s, ""))) # unlist= flatten and put everything into one level = dont have to use double bracket
  gsub('[[:punct:] ]+',' ',my_letters) # removing punctuation
  gsub('[[:digit:]]+', '', my_letters) # digit punctuation
  pangram_check<- all(letters %in% my_letters)
  if (pangram_check){
    return(T)
  } else {
    return(F)
  }

}

#is_pangram("The quick brown fox jumps over 2 the lazy dogs!")




## Problem: 6
#Given two arrays a and b write a function comp(a, b)that checks whether the two arrays 
#have the "same" elements, with the same multiplicities.
#"Same" means, here, that the elements in b are the elements in a squared, regardless of the order

#Write a for loop to check for each number in the first list if its square exists in the second list
#If the answer is no at any point in the for loop, return False

comp<-function(a1,a2){
  squared_nums<-!all(a1^2 %in% a2)
  if(squared_nums){
    return(F)
  }else{
    return(T)
  }
}
#a1 = c(121, 144, 19, 161, 19, 144, 19, 11)
#a2 = c(11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19)

#comp(a,b)



