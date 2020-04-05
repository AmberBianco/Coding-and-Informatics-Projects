#1 Return a new vector that contains  the difference of vectors v1 and v2 such that you are subtracting element of v1 from its corresponding element of v2. v1, v2 are of the same length.

def vec_subtract(v1,v2):
    result=[]
    for i in range(len(v1)):
        result.append(v2[i]-v[i])
    return result

#2 Given 2 parallel lists of exam scores tests1 and tests2 for a class of students. test1 and test2 are of the same length. 
#Return a new list of comprised of the corresponding test score that is the higher of the two scores for each ith student.

def highest_score(lst1,lst2):
    result=[]
    for i in range(len(lst)):
        if lst[i]>lst2[i]
            result.append(lst1[i])
        else:
            result.append(lst2[i])
    return result

#3 Complete this function

def partialSumsList(lst,k):
    """returns a list containing parial sums of the first k elements of lst.
    lst is a list of numbers. k is an integer such that 1<=k<=len(lst)"""
    result=[]
    total=0
    for i in range(k):
        result.append(lst[i]+total)
        total.append(lst[i])
    return result


#4 Write a function names modify_outliers that, given a list lst, will modify each outlier
#by overwriting it with NA. Your function will return nothing. An outlier is a value below low OR above high

def modify_outliers(lst,low,high):
    for i in range (len(lst)):
        if lst[i]<low or lst[i] > high:
            lst[i]= "NA"
    return lst



#6 What is the output of the following function when n=629? What is returned?

def func(n):
    q=""
    while n>0:
        t=n%10
        if t%3==0:
            q=q+ str(t)
        print(n,t,q)
        n=n//10
    return q
func(629)



