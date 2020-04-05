
"""
####String and List Utlilites Project####
####Author: Amber Bianco####


#####Description: 
    This is a python file that contains 9 functions of string and list utilites. This includes three string fucntions that 
    manipulate DNA and six math functions for lists and matrices.####
"""

def colMean(m, col):
    """
    If col is valid return the mean of values in column col, else print "col out of bounds"
    and return.
    :param m: a matrix of numbers represented as a list of lists
    :param col: an integer that represents a valid column index of m
    :return: the float value that is the mean of the values in column col of m
    Example:
    >>> colMean([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2)
    4.0
    """
    try:
        sum_col = 0
        for lst in m:
           sum_col += lst[col]
        avg =sum_col / len(m)
        return avg
    except:
       print("col out of bounds")


def findMaxIndex(lst):
    """ This is a helper function to find the index for the maximum number is list. 
    :Param lst: a list of integers
    :return: The index of the maximum number in this list   
    
    """
    index=0
    for i in range(len(lst)):
        if lst[i]>lst[index]:
            index=i
    return index





def colMode(m, col):
    """
    If col is valid return the mode of values in col else print "col out of bounds" and return.
    :param m: a matrix of integers represented as a list of lists
    :param col: an integer that represents a valid column index of m
    :return: the integer value that is the mode of the values in column col of m
    Example:
    >>> colMode([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2)
    3
    """
    try:
        column = []
        for lst in m:
            column.append(lst[col])
        lst_of_counts = []
        for item in column:
            count_item = 0
            for i in range(len(column)):
                if item == column[i]:
                    count_item += 1
            lst_of_counts.append(count_item)
        Index_of_mode = findMaxIndex(lst_of_counts)
        return column[Index_of_mode]
    except:
        print('col out of bounds')
            
   

def std_dev(lst,avg):
    """Calculated standard deviation of a list.
    :param: a list of numbers
    :param: avg is the mean of lst
    :returns the standard deviation of the list
    """
    s_d= 0 
    for elem in lst:  
        s_d+= (elem-avg)**2
        n= len(lst)
        sd=(s_d/ (n-1) ) ** (0.5)
    return sd


def colStandardize(m, col):
    """
    If col is valid return a new matrix identical to m except that the values in col are
    standardized, else print "col out of bounds" and return.
    :param m: a matrix of numbers represented as a list of lists
    :param col: an integer that represents a valid column index of m
    :return: a new matrix of the contents of m, with values in column col standardized
    Example:
    >>> colStandardize([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2)
    [[2, 4, 1.155], [1, 2, -0.577], [1, 2, -0.577]]
    """
    if 0 <= col and  col < len(m[0]):
        avg= colMean(m,col)
        column= []
        matrix = [] 
        for lst in m:
            column.append(lst[col])
        sd=std_dev(column,avg)
        stand_col =[]
        for elem in column:
            stand_col.append((elem-avg)/sd)
        for i in range(len(m)):
            row = []
            for j in range(len(m[0])):
                if j != col:
                    row.append(m[i][j])
                else:
                    row.append(stand_col[i])
            matrix.append(row)
        return matrix
    else:
        print("col out of bounds")
        return
   
 
 
def findMinIndex(lst):
    """This is a helper function to find the index for the minimum number is list. 
    :Param lst: a list of integers
    :return: The index of the minimum number in this list  
    """
    index=0
    for i in range(len(lst)):
        if lst[i]<lst[index]:
            index=i
    return index
 
def colMinMaxNormalize(m, col):
    """
    If col is valid return a new matrix identical to m except that the values in col are
    Normalized, else print "col out of bounds" and return.
    :param m: a matrix of numbers represented as a list of lists
    :param col: an integer that represents a valid column index of m
    :return: a new matrix of the contents of m with values in column col normalized between 0 and 1
    Example:
    >>> colMinMaxNormalize([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2)  # Example not correct- needs to be float to make sense
    [[2, 4, 1], [1, 2, 0], [1, 2, 0]]
    """
    if 0 <= col and  col < len(m[0]):
        matrix = []
        column=[]
        for lst in m:
            column.append(lst[col])
        max_ind=findMaxIndex(column)
        maximum = column[max_ind]
        min_ind= findMinIndex(column)
        minimum= column [min_ind]
        normalized_col = []
        for elem in column:
            normalized_col.append((elem-minimum)/(maximum-minimum))
        for i in range(len(m)):
            row = []
            for j in range(len(m[0])):
                if j != col:
                    row.append(m[i][j])
                else:
                    row.append(normalized_col[i])
            matrix.append(row)
        return matrix
            
    else:
        print("col out of bounds")
        return
    

 
def mutation(dna, index, newNT):
    """
    If index is valid return a string with that represents a SNP (single nucleotide
    polymorphism) of dna, else print "index out of bounds" and return None.
    :param dna: a string
    :param index: an integer such that 0 <= index < len(dna)
    :param newNT: a string to replace the character at index
    :return: a string composed of the characters of dna with the value at index replaced with newNT
    Example:
    >>> mutation("ACTCGG", 0, "G")
    "GCTCGG"
    """
    new_DNA =""
    if 0 <= index < len(dna):
        for i in range(len(dna)):
            if i != index:
                new_DNA += dna[i]
            else:
                new_DNA += newNT
        return new_DNA
    else:
        print("index out of bounds")
        return
        
 
         
         
     
 
 
def insertion (dna, index, newNTs):
    """
    If index is valid return a string that represents an insertion mutation of dna,
    else print "index out of bounds" and return None.
    :param dna: a string
    :param index: an integer such that 0 <= index <= len(dna)
    :param newNTs: a string to insert into dna at position index
    :return: a string composed of the characters of dna with the value at index replaced with newNT
    Examples:
    >>> insertion ("ACTCGG", 6, "AGC")
    "ACTCGGAGC"
    >>> insertion ("ACTCGG", 7, "AGC")
    "Index out of bounds"
    """
    new_DNA =""
    if 0 <= index <= len(dna):
        for i in range(len(dna)):
            if i != index:
                new_DNA += dna[i]
            else:
                new_DNA += newNTs+ dna[i]
        if index == len(dna):
            new_DNA = dna + newNTs
        return new_DNA
    else:
        print("index out of bounds")
        return


def deletion(dna, index, numNTdeleted ):
    """
    If index is valid return a string that represents a deletion mutation of dna,
    else print "index out of bounds" and return None.
    :param dna: a string
    :param index: an integer such that 0 <= index < len(dna)
    :param numNTdeleted: integer indicating how many characters to delete
    :return: a string composed of the characters of dna with up to numNTdeleted beginning at position index.
    Examples:
    >>> deletion("ACTCGG", 5, 2)
    "ACTCG"
    >>> deletion("ACTCGG", 1, 2)
    " ACGG”
    """
    new_DNA =""
    i=0
    if 0 <= index < len(dna):
        while i < len(dna):
            if i != index:
                new_DNA += dna[i]
                i += 1
            else:
                i += numNTdeleted
        return new_DNA
    else:
        print("index out of bounds")
        return
    
    
 
 
def euclideanDistance(v1, v2):
    """
    Return the euclidean distance between vectors
    :param v1: a vector of numbers represented as a list
    :param v2: a vector of numbers represented as a list
    :return: the float value that is the Euclidean distance between v1 and v2
    Examples:
    >>> euclideanDistance([3, 1], [6, 5])
    5
    >>> euclideanDistance([0, 0], [3, 4])
    5
    >>> euclideanDistance([3, 6, 1, 2, 8, 2, 1], [3, 6, 1, 2, 8, 2, 1])
    """
    total=0
    for i in range(len(v1)):
        total += (v2[i]-v1[i])**2
    return total ** (0.5)

 
def normalizeVector(v):
    """
    Return a new vector that is vector v normalized
    :param v: a vector of numbers represented as a list
    :return: a new vector equivalent to v scaled to length 1 (ie: a unit vector)
    Example:
    >>> normalizeVector([6, 8]) [.6, .8]
    >>> normalizeVector([25,2,7,1,-5,12])
    [0.8585035246793065, 0.06868028197434452, 0.2403809869102058,
    0.03434014098717226, -0.1717007049358613, 0.4120816918460671]
    """
    total = 0
    for elem in v:
        total+= elem **2
    magnitude= total**(0.5)
    norm_vec = []
    for elem in v:
        norm_vec.append( elem/magnitude)
    return norm_vec

 

 
 
def test_suite():
    """ My test cases for Project 2"""
  
       
    T.test(colMean([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2) == 4.0) 
    T.test(abs(colMean([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2) - 4.0) < .0000001) 
    
    T.test(colMean([[0, 0, 0], [0, 0, 0], [0, 0, 0]], 0)==0)
    T.test(colMean([[-1, -2, -3], [-4, -5, -6], [-7, -8, -9]], 2)== -6.0)
    T.test(abs(colMean([[8,1,6], [4, 9, 2], [3, 7, 5]], 1) -5.66667) <.0001)
    T.test(colMean([[8,1,6], [4, 9, 2], [3, 7, 5], [2,1,0],[7,9,1]], 2)== 2.8)
    T.test(colMean([[8], [4], [3], [2],[7]], 0)==4.8)
    T.test(colMean([[-1, -2, -3], [-4, -5, -6], [-7, -8, -9]], -2)==-5.0)
    T.test(colMean([[-4, 0, 0], [1, 2,3], [7,5,3]], -1)==2.0)
    T.test(colMean([[0], [1, 2,3], [7,5,3]], 1)== None)
    T.test(colMean([[0], [1,], [7,5,3]], 0)==2.6666666666666665)
    T.test(colMean([[1, 1, 1], [2, 2, 2], [3, 3, 3]], 1)==2.0)
    
    T.test(findMaxIndex([0,0,0])==0)
    T.test(findMaxIndex([-5,-2,-3])==1)
    T.test(findMaxIndex([-7,-5,4,6,6])==3)
    T.test(findMaxIndex([10,15])==1)
    T.test(findMaxIndex([1])==0)
    
    T.test(colMode([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2) == 3) 
   
    T.test(colMode([[0, 0, 0], [0, 0, 0], [0, 0, 0]], 0)==0)
    T.test(colMode([[-1, -2, -3], [-4, -5, -6], [-7, -8, -9]], 1)== -2)
    T.test(colMode([[-1, 5, -2], [-4, -5, 3], [-4, 0, -9]], 1)==5)
    T.test(colMode([[-1, 5, -2], [-4, -5, 3], [-4, 0, -9]],-1)== -2)
    T.test(colMode([[5], [-4], [0]],0)==5)
    T.test(colMode([[5,6,7], [-4,-3,-2], [9,4,1]],2)==7)
    T.test(colMode([[1,7,0], [-4,-3,-2], [3,4,8]],-3)==1)
    T.test(colMode([[2,2,0], [4,1,-2], [0,4,8]],4)== None)
    T.test(colMode([[0], [1], [2]], -1)==0)
    T.test(colMode([[0], [1], [2]], 2)== None)
    

    T.test(std_dev([0,0,0],0)==0.0)
    T.test(std_dev([-1,-2,-3],2)==5)
    T.test(std_dev([-6-2,5],5)==13.0)
    T.test(std_dev([5,1],1)==4.0)
    T.test(std_dev([44.6,52.1,100],-10)==97.30768212222506)

    T.test(colStandardize([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2)== [[2, 4, 1.1547005383792517],[1, 2, -0.5773502691896258],[1, 2, -0.5773502691896258]]) 
    
    T.test(colStandardize([[0, 1, 0], [0, 2, 0], [1, 2, 0]], 1)==[[0, -1.1547005383792517, 0],[0, 0.5773502691896256, 0],[1, 0.5773502691896256, 0]])
    T.test(colStandardize([[-1, -2, -3], [-4, -5, -6], [-7, -8, -9]], 1)==[[-1, 1.0, -3], [-4, 0.0, -6], [-7, -1.0, -9]])
    T.test(colStandardize([[-1, -2, -3], [4, 5, 6], [-7, -8, -9]], -1)== None)
    T.test(colStandardize([[0,0,0], [4, 5, 6], [0, 0, 0]], 1)==[[0, -0.5773502691896258, 0],[4, 1.1547005383792515, 6],[0, -0.5773502691896258, 0]])
    T.test(colStandardize([[0,0,0], [-1, 5, 9], [2, 2, 2]], 2)==[[0, 0, -0.775880177444458],[-1, 5, 1.1285529853737573],[2, 2, -0.35267280792929906]])
    T.test(colStandardize([[9,1,6], [6, 5, 9], [9, 0, 2]], 3)==None)
    T.test(colStandardize([[6,9,1,6], [7,6, 5, 9], [0,9, 0, 2]],3)==[[6, 9, 1, 0.09491579957524982],[7, 6, 5, 0.9491579957524989],[0, 9, 0, -1.044073795327749]])
    T.test(colStandardize([[7,2,7,1,7], [0,7,6, 5, 4], [0,0,4,3,2]],4)==[[7, 2, 7, 1, 1.0596258856520353],[0, 7, 6, 5, -0.13245323570650427],[0, 0, 4, 3, -0.9271726499455306]])
    T.test(colStandardize([[0], [1], [2]],0)==[[-1.0], [0.0], [1.0]])
    T.test(colStandardize([[5], [4], [9]],-1)== None)
    

    T.test(findMinIndex([-1,2])==0)
    T.test(findMinIndex([0,0,0])==0)
    T.test(findMinIndex([100,1000,25,1])==3)
    T.test(findMinIndex([-1,-9,-2.1,-9])==1)
    T.test(findMinIndex([44.7,60,5,6,0])==4)
    T.test(findMinIndex([8,1,1,1])==1)


    T.test(colMinMaxNormalize([[2, 4, 6], [1, 2, 3], [1, 2, 3]], 2) == [[2, 4, 1.0], [1, 2, 0.0], [1, 2, 0.0]]) 
    
    T.test(colMinMaxNormalize([[0,1,2,], [3,4,5], [6,7,8]], 1)==[[0, 0.0, 2], [3, 0.5, 5], [6, 1.0, 8]])
    T.test(colMinMaxNormalize([[5,7,2], [-3,-4,-5], [6,7,8]], 1)== [[5, 1.0, 2], [-3, 0.0, -5], [6, 1.0, 8]])
    T.test(colMinMaxNormalize([[1,1,1], [2,2,2], [3,3,3]], -2)== None)
    T.test(colMinMaxNormalize([[5,3,1], [2,4,6], [7,9,9]], 0)==[[0.6, 3, 1], [0.0, 4, 6], [1.0, 9, 9]])
    T.test(colMinMaxNormalize([[4], [-1], [9]], 0)==[[0.5], [0.0], [1.0]])
    T.test(colMinMaxNormalize([[0], [1], [2]], 1)== None)
    T.test(colMinMaxNormalize([[4,4,2,5], [0,6,9,1], [7,3,5,1]], 2)==[[4, 4, 0.0, 5], [0, 6, 1.0, 1], [7, 3, 0.42857142857142855, 1]])
    T.test(colMinMaxNormalize([[6,5], [0,6,], [1,9]], 0)==[[1.0, 5], [0.0, 6], [0.16666666666666666, 9]])
    T.test(colMinMaxNormalize([[6,5,4], [2,7,1], [0,0,0]], 2)==[[6, 5, 1.0], [2, 7, 0.25], [0, 0, 0.0]])
    T.test(colMinMaxNormalize([[3,1,1], [0,9,8], [7,7,7]], -3)== None)

    T.test(mutation("ACTCGG", 0, "G") == "GCTCGG") 
    
    T.test(mutation("", 0, "G")== None)
    T.test(mutation("ACTCGG", len("ACTCGG"), "G") == None)
    T.test(mutation("ACTCGGCTTTA", 2, "aaa")=='ACaaaCGGCTTTA')
    T.test(mutation("AAACCCTTTGGG", len("AAACCCTTTGGG")-1, "CCC")=='AAACCCTTTGGCCC')
    T.test(mutation("ACGTAC", 3, "")=='ACGAC')
    T.test(mutation("ACGACGACGACGACGACGACGACGACGACGACGACGACGACGACGACG", 12, "TTTT")=='ACGACGACGACGTTTTCGACGACGACGACGACGACGACGACGACGACGACG')
    T.test(mutation("ACGGGTTAATTGGCC",0, "   ")=='   CGGGTTAATTGGCC')
    T.test(mutation("CCCCGGGGTTTTAAAA",5, "AC   TT")=='CCCCGAC   TTGGTTTTAAAA')
    T.test(mutation("",0,"ACTGGGGTAACC")== None)
    T.test(mutation("A",0,"AAGCCCCCCTT")=='AAGCCCCCCTT')
    
    


    T.test(insertion ("ACTCGG", 6, "AGC") == "ACTCGGAGC") 
    T.test(insertion ("ACTCGG", 7, "AGC") == None)
    
    T.test(insertion ("", 0, "AGC")=="AGC")
    T.test(insertion ("ACTCGG", 0, "")== 'ACTCGG')
    T.test(insertion ("ACTCGG", len("ACTCGG")+1, "AGC")== None)
    T.test(insertion("AAACCCGGG", len("AAACCCGGG"), "A")=='AAACCCGGGA')
    T.test(insertion("",0, "")== '')
    T.test(insertion("",1, "")== None)
    T.test(insertion("ACTCGCG",1, "")=='ACTCGCG')
    T.test(insertion("ACTCGCGACTCGGACTCGGACTCGGACTCGGACTCGGACTCGG",10, "AAAAC")=='ACTCGCGACTAAAACCGGACTCGGACTCGGACTCGGACTCGGACTCGG')
    T.test(insertion("ACTC",9, "GGTC")== None)
    T.test(insertion("GCTAC",-2, "GGTC")== None)
    
    
    T.test(deletion("ACTCGG", 5, 2) == "ACTCG") 
    T.test(deletion("ACTCGG", 1, 2) == "ACGG") 
    

    T.test(deletion("", 0, 2)== None)
    T.test(deletion("ACTCGG", 0, 2)== 'TCGG') 
    T.test(deletion("ACTCGG", 0, 6)== '')
    T.test(deletion("AAGGAAACCATT", -1, 3)== None)
    T.test(deletion("AAAGGAAAGGGCCCTTTAAAGGGCCCTTTAAAGGGCCCTTTGCCCTTT", 10, 30)=='AAAGGAAAGGTGCCCTTT')
    T.test(deletion("AAAGGGCCCTTT", 0, 6)=='CCCTTT')
    T.test(deletion("", 1, 3)== None)
    T.test(deletion("TATATACCGG", 4, 4)=='TATAGG')
    T.test(deletion("ACGACGACGACGACGACGACGACGACGACGACGACGACGACG", 15, 17)=='ACGACGACGACGACGGACGACGACG')
    T.test(deletion("ACGACGACGACGACG", 4, 10)=='ACGAG')
    #deletion("ACTCGG", 0, 0)== 'ACTCGG' = fails making infinite loop#
    
    T.test(euclideanDistance([3, 1], [6, 5]) == 5) 
    T.test(euclideanDistance([0, 0], [3, 4]) == 5) 
    T.test(abs(euclideanDistance([3, 1], [6, 5]) - 5) < .0000001) 
    T.test(abs(euclideanDistance([0, 0], [3, 4]) - 5) < .0000001) 
    T.test(euclideanDistance([3, 6, 1, 2, 8, 2, 1], [3, 6, 1, 2, 8, 2, 1]) == 0) 
    
    T.test(euclideanDistance([0,0,0], [0,0,0])==0.0)
    T.test(abs(euclideanDistance([-3,-4,-5], [-6,-7,-8])- 5.19615)<.0001)
    T.test(euclideanDistance([-2, -4, -7 ], [-7,-8, -9])== 6.708203932499369)
    T.test(euclideanDistance([0, 1, 9 ], [-6,-2, -1])== 12.041594578792296)
    T.test(euclideanDistance([1], [-1])== 2.0)
    T.test(euclideanDistance([4], [0,1])== 4.0)
    T.test(euclideanDistance([9,-9,4,0,0], [6,0,-1,1,6,6])==12.328828005937952)
    T.test(euclideanDistance([0], [0,11])==0.0)
    T.test(euclideanDistance([100,66,22], [1000,1,1])==902.5884998159461)
    T.test(euclideanDistance([10.1,20.2,30.3], [4,5,6])==29.304265901059527)
    T.test(euclideanDistance([5,3,3.6], [0,-6,2])==10.419213022104884)
    
    
   




    T.test(normalizeVector([6, 8]) == [.6, .8]) 
    T.test(abs(normalizeVector([6, 8])[0] - .6) < .0000001) 
    T.test(abs(normalizeVector([6, 8])[1] - .8) < .0000001) 
    T.test(normalizeVector([25,2,7,1,-5,12]) == [0.8585035246793065, 0.06868028197434452, 0.2403809869102058, 0.03434014098717226, -0.1717007049358613, 0.4120816918460671]) 
    T.test(normalizeVector([1,0,0,0])==[1.0, 0.0, 0.0, 0.0]) 
    T.test(normalizeVector([1,-2,3,-4])==[0.18257418583505536,-0.3651483716701107,0.5477225575051661,-0.7302967433402214])
    T.test(normalizeVector([-9,-8,-1,-2,-7,-7])==[-0.5715005715008572,-0.508000508000762,-0.06350006350009525,-0.1270001270001905,-0.4445004445006667,-0.4445004445006667])
    T.test(normalizeVector([3])==[1.0])
    T.test(normalizeVector([-9])==[-1.0])
    T.test(normalizeVector([-8,1])==[-0.9922778767136677, 0.12403473458920847])
    T.test(normalizeVector([5,5])==[0.7071067811865475, 0.7071067811865475])
    T.test(normalizeVector([-4,4,4])==[-0.5773502691896258, 0.5773502691896258, 0.5773502691896258])
    T.test(normalizeVector([0,1,2,3])==[0.0, 0.2672612419124244, 0.5345224838248488, 0.8017837257372732])
    
     
     
if __name__ == '__main__':
    import unit_tester as T
    test_suite()
