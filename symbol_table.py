from sys import*

def GenTable(Str):
    lexemes = ""
    var = ""
    Symtab = []
    i = 1
    for char in Str:
        lexemes += char
        if lexemes == " ":
            if var != "":
                Symtab.append(var+"\tidentifier\t"+str(i-len(var)))
                var = ""
            lexemes = ""
        elif lexemes == "+" or lexemes == "-" or lexemes == "*" or lexemes == "/" or lexemes == "=":
            if var != "":
                Symtab.append(var+"\tidentifier\t"+str(i-len(var)))
                var = ""
            #Append "+"
            Symtab.append(lexemes+"\toperator\t"+str(i))
            lexemes = ""
        var += lexemes
        lexemes = ""
        i+= 1
    if var != "":
        Symtab.append(var+"\tidentifier\t"+str(i-len(var)))
        var = ""
    return Symtab

def PrintTab(table):
    for Str in table:
        print(Str)

def main():
    Symtab = GenTable(argv[1])
    PrintTab(Symtab)

main()