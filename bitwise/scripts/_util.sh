

function_exists() {   
	which $1 > /dev/null;   return $?; 
}

function check_environment() {

	#python
	function_exists python && PYTHON=$(which python) || echo 'python is not installed.'
	#php
	function_exists php && PHP=$(which php) || echo 'php is not installed.'
	#pypy
	function_exists pypy && PYPY=$(which pypy) || echo 'pypy is not installed.'
	#gcc
	function_exists gcc && GCC=$(which gcc) || echo 'gcc is not installed.'
	#java
	function_exists javac && JAVAC=$(which javac) || echo 'javac is not installed.'
	#java
	function_exists java && JAVA=$(which java) || echo 'javac is not installed.'

	cd $ROOT_FOLDER
	ROOT_FOLDER=$(pwd $ROOT_FOLDER)
}

function GetFilenameWithoutExtension() {
	filename=$(basename "$1")
	#extension="${filename##*.}"
	java_file="${filename%.*}"
}

function run_php() {
	echo '-------------------------------------'
	echo 'Running PHP code'
	echo '-------------------------------------'
	for file in $(find $ROOT_FOLDER -name '*.php' ) 
	do 
		echo
		echo $file
		echo '---------------'
		eval $TIME -f $TIME_OPTIONS $PHP $file
	done
}

function run_java() {
	echo '-------------------------------------'
	echo 'Running JAVA code'
	echo '-------------------------------------'
	for file in $(find $ROOT_FOLDER -name '*.java' ) 
	do
		filename=$(basename "$file")
		folder=$(dirname "$file")
		#extension="${filename##*.}"
		f="${filename%.*}" 

		echo $file
		echo '---------------'
		cd $folder
		$JAVAC $file
		eval $TIME -f $TIME_OPTIONS $JAVA $f
		cd - > /dev/null
	done
}
