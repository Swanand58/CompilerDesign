# Compiler Design Assignments

This repository contains college assignments for a Compiler Design course. The assignments cover various aspects of compiler construction, including lexical analysis, syntax analysis, and code generation.

## Contents

- **Lexical Analysis (`.l` files)**: Flex code for tokenizing input.
- **Syntax Analysis (`.y` files)**: Yacc/Bison code for parsing grammar.
- **C Programs (`.c` files)**: C code for various compiler-related tasks.
- **Python Scripts (`.py` files)**: Python scripts for different compiler functionalities.

## Getting Started

### Prerequisites

To run the code in this repository, you need the following tools installed:

- Flex
- Bison
- GCC
- Python

### Running the Code

1. **Lexical Analysis**: Use Flex to generate the lexer.

   ```sh
   flex filename.l
   gcc lex.yy.c -o lexer
   ./lexer
   ```

2. **Syntax Analysis**: Use Bison to generate the parser.

   ```sh
   bison -d filename.y
   flex filename.l
   gcc filename.tab.c lex.yy.c -o parser
   ./parser
   ```

3. **C Programs**: Compile and run the C code.

   ```sh
   gcc filename.c -o program
   ./program
   ```

4. **Python Scripts**: Run the Python scripts.
   ```sh
   python3 filename.py
   ```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Course Instructor: [Prof. Vrushali Kulkarni]
- Institution: [Vishwakarma Institute of Technology - Pune]
