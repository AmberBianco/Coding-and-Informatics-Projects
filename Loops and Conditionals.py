#Amber Bianco_HW
#Complete ch 7 (iteration):  exercises 1,  2, 10, 14, 15, 16

#Spoiler alert: Hints below for  #10 and #16

#Hint for #10: An integer greater than one is called a prime number if its only positive divisors (factors) are one and itself.
            #Due to this definition, you may assume the number you are testing (to see if it is prime) is a positive integer greater than one.
            # Use actual examples: is 6 prime? No, it is divisible by 2 and by 3.    Is 5 prime? Yes, because it is only divisible by 1 and 5, not by 2, 3 or 4
            #So if you want to know if 6 is prime, you should test if it is divisible by which numbers?  How about detecting if 5 is prime?

 
#Hint for #16:   Use the "pattern of computation call a counter". 
#1 Write a function to count how many odd numbers are in a list.
# list of numbers 



#1
list1 = [1, 34, 54, 49, 72, 89, 8,55] 
  
def count_odd (odds_list):
    odds_count=0
    for num in odds_list: 
        if num % 2 != 0: 
            odds_count += 1
    return odds_count
count_odd(list1)



#2 

list1 = [1, 34, 54, 49, 72, 89, 8,55] 
  

def count_even(evens_list):
    even_count=0
    for num in evens_list: 
        if num % 2 == 0: 
            even_count += 1
    return even_count
  
count_even(list1) 


#10 Write a function, is_prime, which takes a single integer argument and returns True when the argument is a prime number and False otherwise. Add tests for cases like this:

def is_prime(x):
  for n in range(2, x):
    if x % n == 0 and n != x:
      print("False")
      return False
    else:
      print ("True")
      return True

#test(is_prime(11))  #TRUE
#test(not is_prime(35)) #FALSE
#test(is_prime(19911121)) #TRUE

 #An integer greater than one is called a prime number if its only positive divisors (factors) are one and itself.
   #Due to this definition, you may assume the number you are testing (to see if it is prime) is a positive integer greater than one.
   #Use actual examples: is 6 prime? No, it is divisible by 2 and by 3.    Is 5 prime? Yes, because it is only divisible by 1 and 5, not by 2, 3 or 4
   #So if you want to know if 6 is prime, you should test if it is divisible by which numbers?  How about detecting if 5 is prime?


   #14 What will num_digits(0) # gave me zero= zero is a digit so should tell us one. Modify it to return 1 for this case. Why does a call to num_digits(-24) result in an infinite loop? (hint: -1//10 evaluates to -1) Modify num_digits so that it works correctly with any integer value. Add these tests:
#test(num_digits(0) == 1) #FALSE
#test(num_digits(-12345) == 5)

def num_digits(n):    
    count = 0 
    n=abs(n)
    if n ==0: 
        return 1 
    else:  
        while n != 0:       
            count = count + 1  
            n = n // 10 
        return count 
#test(num_digits(0) == 1)
#test(num_digits(-12345) == 5)

#Why does a call to num_digits(-24) result in an infinite loop? # Becase the number is negative- =1//10 will never equal zero because it is a negative


#15  Write a function num_even_digits(n) that counts the number of even digits in n. These tests should pass:

def num_even_digits(n):
    count = 0
    if n==0:
        return 1
    else: 
        while n > 0:
            digit = n % 10
            if digit % 2==0:
                count = count + 1
            n = n // 10
        return count


#test(num_even_digits(123456) == 3)  #TRUE
#test(num_even_digits(2468) == 4) #TRUE
#test(num_even_digits(1357) == 0) #TRUE
#test(num_even_digits(0) == 1) #TRUE


#16 Write a function sum_of_squares(xs) that computes the sum of the squares of the numbers in the list xs. For example, sum_of_squares([2, 3, 4]) should return 4+9+16 which is 29:

def sum_of_squares(lst):
    total = 0
    for i in range(len(lst)):
        total = total + (lst[i] *lst[i])
    return total


print(sum_of_squares([2, 3, 4]))


#test(sum_of_squares([2, 3, 4]) == 29) #TRUE
#test(sum_of_squares([ ]) == 0) # TRUE
#test(sum_of_squares([2, -3, 4]) == 29) #TRUE

#Hint for #16:   Use the "pattern of computation call a counter". 