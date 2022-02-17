variables = []
index = 1

def Check_if_Operand(c):
    if c=='+' or c=='-' or c=='/' or c=='*' or c=='(' or c==')':
        return False
    else:
        return True

def Check_priority(c,t):
    if ((c=='+' or c=='-') and (t=='*' or t=='/')):
        return True
    else:
        return False

def toPostfix(infix):
    stack = []
    postfix = ''
    var = infix[0]
    infix = infix[2::]
    for c in infix:   
        if Check_if_Operand(c):
            postfix += c
        else:
            if c=='(':
                stack.append(c)
            elif c==')':
                operator = stack.pop()
                while operator != '(':
                    postfix += operator
                    operator = stack.pop()
            else:
                while len(stack)!=0 and Check_priority(c, stack[-1]):
                    postfix += stack.pop()
                stack.append(c)
    
    while len(stack)!=0:
        postfix+=stack.pop()

    return postfix,var

def checkexistance(string, variables):
    i = 0
    for e in variables:
        if e == string:
            return i
        i += 1
    return -1

def populateVariables(postfix,var):
    a = postfix[0]
    b = postfix[1]
    global index
    i = 0
    while i<len(postfix):
        c = postfix[i]
        if not Check_if_Operand(c):
            stat = checkexistance(a+b+c,variables)
            pos = index
            if stat==-1:
                variables.append(a+b+c)
                index += 1
            else:
                pos=stat+1
            a = postfix[i-3]
            postfix = postfix[0:i-2]+str(pos)+postfix[i+1::]
            i -= 2
            b = str(pos)
        else:
            a = b
            b = postfix[i]
        i+=1
    index -= 1
    variables.append(var+str(index))

    i = 1
    tobereturened = []
    for c in variables:
        if len(c) == 2:
            tobereturened.append(c[0]+'=t'+c[1])
        else:
            string = 't'+str(i)+'='
            if(c[0].isnumeric()):
                string += 't'+c[0]
            else:
                string += c[0]
            string += c[2]
            if(c[1].isnumeric()):
                string += 't'+c[1]
            else:
                string += c[1]
            tobereturened.append(string)
        i+=1

    return tobereturened

def Quadraples_Tripple(threeAdressCode, triple):
    if not triple:
        print('op\targ1\targ2\tresult')
    else:
        print('op\targ1\targ2')

    for e in threeAdressCode:
        result = ''
        op = ''
        arg1 = ''
        arg2 = ''
        stage = 0
        for c in e:
            if c!='=' and stage == 0:
                result+=c
            if c == '=':
                stage+=1
            if Check_if_Operand(c) and stage == 1:
                arg1 +=c
            if not Check_if_Operand(c):
                op = c
                stage += 1
            if stage == 2:
                arg2 += c
        arg1 = arg1[1::]
        arg2 = arg2[1::]

        if not triple:
            print(op+'\t'+arg1+'\t'+arg2+'\t'+result)
        else:
            print(op+'\t'+arg1+'\t'+arg2)

Expression = input("Enter the expression:::  ")

print("Expression is:")
print(Expression)

postfix,var = toPostfix(Expression)
threeAdressCode = populateVariables(postfix, var)

print("\nThree Address Code for the Expression is:")
for c in threeAdressCode:
    print(c)

print('\nQuadraples for given Expression is:')
Quadraples_Tripple(threeAdressCode, False)

print('\nTriples for given Expression is:')
Quadraples_Tripple(threeAdressCode, True)