#placeholders for various executables
PHP=	  #php interpreter
JAVAC=    #java compiler
JAVA=     #java interpreter
GCC=      #c compiler
PYPY=     #pypy
PYTHON=   #python interpreter

#general config section 
ROOT_FOLDER=. #folder to look for programs to test, 
	      #script will cd to it before executing test


TIME=$(which time); #program to measure execution time
TIME_OPTIONS='"%E real \n%U user\n%S sys"' #check man pages for details

#end of config section
