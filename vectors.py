#Chapter 11 is a very important chapter for Health Informatics. In this chapter you gain an understanding of the vectors, matrices, and their relationship to each other.  Many approaches in Health Informatics, such as regression, are founded in use of matrices and vectors.

# This assignment is long and worth twice as many points as previous labs. Pace yourself.

# Complete exercises 4, 5,6,7 , 9, 10, 11 in the text at the end of Chapter 11

# Also complete matrix operations  from  earlier version of text found here:

# http://www.openbookproject.net/thinkcs/python/english2e/ch09.html (Links to an external site.)

# Read and understand def make_matrix(rows, columns) in  Section 9.19

# Do problems   11,12, 13,14  

# Hint: import your vectors module and call on vector functions to solve matrix problems

#  
import unit_tester as test


#4
# Test 1 The output would be : False because lists are not stored the same in memory even with the same information in the list
#the output would beTest 2: True:  This is because that=this makes "this" "thats" alias. What you alias a list, you are calling the same
#list from memory

#5

def add_vectors(u, v):
    """assumption: Lists u and v are the same size. Paramaters: u is a list of numbers. v is a list of numbers. Returns: new list containing the sums of the corresponding elements of each lists."""
    new_lst=[]
    for i in range(len(u)):
        new_lst.append(u[i]+v[i])
    return new_lst
   
test.test(add_vectors([1, 1], [1, 1]) == [2, 2])
test.test(add_vectors([1, 2], [1, 4]) == [2, 6])
test.test(add_vectors([1, 2, 1], [1, 4, 3]) == [2, 6, 4])

#6


def scalar_mult(s, v):
    """paramater s is a scalar number and v is a list. Return new_lst that returns scalar multiple of s and v"""
    new_lst=[]
    for elem in v:
        new_lst.append(s*elem)
    return new_lst
test.test(scalar_mult(5, [1, 2]) == [5, 10])
test.test(scalar_mult(3, [1, 0, -1]) == [3, 0, -3])
test.test(scalar_mult(7, [3, 0, 5, 11, 2]) == [21, 0, 35, 77, 14])

#7

def dot_product(u, v):
    """"assumption: Lists u and v are the same size. Paramaters: u is a list of numbers. v is a list of numbers. Returns new_lst that is the Sum of the products of the corresponding elements of each."""
    result=0
  
    for i in range(len(u)):
        result+= u[i]*v[i]
    return result


test.test(dot_product([1, 1], [1, 1]) ==  2)
test.test(dot_product([1, 2], [1, 4]) ==  9)
test.test(dot_product([1, 2, 1], [1, 4, 3]) == 12)

#9
#.split() breaks up a string at the character inside its parameter into a list of strings. .join() joins together a list of stings based on the string provided before the dot. In this example this string being broken up by .split() is song
#and the list created from this break is the parameter for .join().

#They are the opposites in this example.



#10

def replace (s,old,new):
    """Paramaters: 's' is a string that will be modified. Old is the character or string that will be replaced . New is the string or character that will replace the old. Returns new_s that is s modified by replacing old with new"""
    return new.join(s.split(old))
  



test.test(replace("Mississippi", "i", "I") == "MIssIssIppI")

s = "I love spom! Spom is my favorite food. Spom, spom, yum!"
test.test(replace(s, "om", "am") =="I love spam! Spam is my favorite food. Spam, spam, yum!")

test.test(replace(s, "o", "a") =="I lave spam! Spam is my favarite faad. Spam, spam, yum!")





#11
# The first lines display what the  results of a and b should be. Then it swaps a and b. It does not print a and b swapped at the last print statetement 
#but that is what i believe is intended 

#why: a and b do not get swapped. the swap function is a pure function 




