###PREDICTING HUNTINGTONS DISEASE PROJECT###
###Author: Amber Bianco###

#### This program takes a user"s name and genetic sequence to provide Huntington's Disease classification and status based on the number of CAG repeats### 


import sys

def test(did_pass):
    """  Print the result of a test.  """
    linenum = sys._getframe(1).f_lineno   # Get the caller's line number.
    if did_pass:
        msg = "Test at line {0} ok.".format(linenum)
    else:
        msg = ("Test at line {0} FAILED.".format(linenum))
    print(msg)

def test_suite():
    """ Run the suite of tests for code in this module (this file)."""
    test(countCAG("C")== 0)
    test(countCAG("CAGCA") == 1)
    test(countCAG("CAGCATCAGCAGCAG") == 1) #see specs
    test(countCAG("CAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCAGCA") == 41)
    test(prediction(26) == ('Normal', 'Unaffected') ) #boundary case
    test(prediction(34) == ('Intermediate', 'Unaffected'))
    test(prediction(38) == ('Reduced Penetrance', 'Somewhat Affected'))
    test(prediction(45) == ('Full Penetrance', 'Affected'))


def get_input():
    """get persons first name, last name and dna sequence,no parameter required. Returns a tuple with three strings that are first name, last name and DNA sequence"""
    fname = input("Input your First Name : ")
    lname = input("Input your Last Name : ")
    dna = input("Input your DNA Sequence: ")
    return ( fname,lname,dna)


def countCAG(dna):
    """doc string will count the CAG in the DNA sequence provided. Parameter dna: DNA sequence containing CAG repeats that is read in three index frames. Returns count: the number of times CAG appears in DNA.
    Preconditions: Assumes DNA begins CAG sequence. Assumes DNA base pairs are accurate and stops at first non CAG sequence."""
    count=0
    i=0
    while i< len(dna):
        if dna [i:i+3]=="CAG":
            count += 1
            i += 3
        else:
            break
    return count 


def prediction( numCAG):
    """ Calculates disease classification and disease status based on CAG repeats. Parameter numCAG: the number of CAG repeats are compared in a classification table. Returns (classification, status)"""

    if numCAG > 39:
        classification = "Full Penetrance"
        status = "Affected"
    elif  36<= numCAG <= 39:
        classification = "Reduced Penetrance"
        status ="Somewhat Affected"
    elif 27 <= numCAG <= 35:
        classification = "Intermediate"
        status = "Unaffected"
    elif  numCAG < 27:
        classification = "Normal"
        status = "Unaffected"
    return (classification, status)


inputs= get_input()
repeats= countCAG(inputs[2])
disease= prediction(repeats)

print("The patient,", inputs[0], inputs[1],"is classified as",disease[0], "with disease status",disease[1], "because there are", repeats," CAG condons in their DNA sequence:",inputs[2])



##test_suite()
##
##
##test(countCAG("CAGCAGCAGCAGAAACAGCAG")== 4)
##test(countCAG("TAGCAGCAGCAGAAACAGCAG")==0)
##test(countCAG("CAGCAGCAGCAGCAGCAG")==6)
##
##test(prediction(25)== ("Normal", "Unaffected"))
##test(prediction(27)== ("Intermediate", "Unaffected"))
##test(prediction(33)== ("Intermediate", "Unaffected"))
##test(prediction(35)== ("Intermediate", "Unaffected"))
##test(prediction(36)== ("Reduced Penetrance", "Somewhat Affected"))
##test(prediction(38)== ("Reduced Penetrance", "Somewhat Affected"))
##test(prediction(39)== ("Reduced Penetrance", "Somewhat Affected"))
##test(prediction(40)== ("Full Penetrance", "Affected"))
