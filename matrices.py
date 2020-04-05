
11
def add_row(matrix):
    """
      >>> m = [[0, 0], [0, 0]]
      >>> add_row(m)
      [[0, 0], [0, 0], [0, 0]]
      >>> n = [[3, 2, 5], [1, 4, 7]]
      >>> add_row(n)
      [[3, 2, 5], [1, 4, 7], [0, 0, 0]]
      >>> n
      [[3, 2, 5], [1, 4, 7]]
    """
    newmatrix = []
    for row in matrix:
        newrow = [len(matrix[0]) * [0]]  
        new = newmatrix + newrow
    return matrix + new



def add_column(matrix):
    """
      >>> m = [[0, 0], [0, 0]]
      >>> add_column(m)
      [[0, 0, 0], [0, 0, 0]]
      >>> n = [[3, 2], [5, 1], [4, 7]]
      >>> add_column(n)
      [[3, 2, 0], [5, 1, 0], [4, 7, 0]]
      >>> n
      [[3, 2], [5, 1], [4, 7]]
    """
    newmatrix = [[]] * len(matrix) 
    for i in range(len(matrix)):
        newmatrix[i] = matrix[i] + [0] 
    return newmatrix







#12
def add_matrices(m1, m2):
    """
      >>> a = [[1, 2], [3, 4]]
      >>> b = [[2, 2], [2, 2]]
      >>> add_matrices(a, b)
      [[3, 4], [5, 6]]
      >>> c = [[8, 2], [3, 4], [5, 7]]
      >>> d = [[3, 2], [9, 2], [10, 12]]
      >>> add_matrices(c, d)
      [[11, 4], [12, 6], [15, 19]]
      >>> c
      [[8, 2], [3, 4], [5, 7]]
      >>> d
      [[3, 2], [9, 2], [10, 12]]
   """
    mat1= m1[:]
    mat2=m2[:]
    mat_sum= []
    for i in range(len(m1)):
        added_row=[]
        for j in range(len(mat1[i])):
            added_row.append (mat1[i][j] + mat2[i][j])
        mat_sum.append(added_row)
    return mat_sum
#13

def scalar_mult(s, m):
    """
      >>> a = [[1, 2], [3, 4]]
      >>> scalar_mult(3, a)
      [[3, 6], [9, 12]]
      >>> b = [[3, 5, 7], [1, 1, 1], [0, 2, 0], [2, 2, 3]]
      >>> scalar_mult(10, b)
      [[30, 50, 70], [10, 10, 10], [0, 20, 0], [20, 20, 30]]
      >>> b
      [[3, 5, 7], [1, 1, 1], [0, 2, 0], [2, 2, 3]]
    """
    mult_lst = []
    for row in m:
        new_row = []
        for elem in row:
            new_row.append(elem * s)
        mult_lst.append(new_row)
    return mult_lst


#14

def row_times_column(m1, row, m2, column):
  """
    >>> row_times_column([[1, 2], [3, 4]], 0, [[5, 6], [7, 8]], 0)
    19
    >>> row_times_column([[1, 2], [3, 4]], 0, [[5, 6], [7, 8]], 1)
    22
    >>> row_times_column([[1, 2], [3, 4]], 1, [[5, 6], [7, 8]], 0)
    43
    >>> row_times_column([[1, 2], [3, 4]], 1, [[5, 6], [7, 8]], 1)
    50
  """

  result = 0
  for i in range(len(m1[row])):
    result = result + m1[row][i] * m2[i][column]
  return result

def matrix_mult(m1, m2):
    """
        >>> matrix_mult([[1, 2], [3,  4]], [[5, 6], [7, 8]])
        [[19, 22], [43, 50]]
        >>> matrix_mult([[1, 2, 3], [4,  5, 6]], [[7, 8], [9, 1], [2, 3]])
        [[31, 19], [85, 55]]
        >>> matrix_mult([[7, 8], [9, 1], [2, 3]], [[1, 2, 3], [4, 5, 6]])
        [[39, 54, 69], [13, 23, 33], [14, 19, 24]]
    """

    rows_m1 = len(m1)
    cols_m2 = len(m2[0])
    mult_matrix = []
    for row in range(rows_m1):
        new_row = []
        for column in range(cols_m2):
            new_row.append(row_times_column(m1, row, m2, column))
        mult_matrix.append(new_row)
    return mult_matrix

if __name__ == '__main__':
    import doctest
    doctest.testmod()


