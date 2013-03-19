<?php
//Some random string
$s="the revelation of saint john the divine"; 

//let us remove all the chars that 
//are not defined in the dictionary
$s=preg_replace('/[ -@]/', '', $s);
$s=preg_replace('/[[ -_]/', '', $s);

//let us define the hash 
//table with sort order
$key=array( "a" => 0,
            "b" => 0,
            "c"=> 0,
            "d"=> 0,
            "e"=> 0,
            "f"=> 0,
            "g"=> 0,
            "h"=> 0,
            "i"=> 0,
            "j"=> 0,
            "k"=> 0,
            "l"=> 0,
            "m"=> 0,
            "n"=> 0,
            "o"=> 0,
            "p"=> 0,
            "q"=> 0,
            "r"=> 0,
            "s"=> 0,
            "t"=> 0,
            "u"=> 0,
            "v"=> 0,
            "w"=> 0,
            "x"=> 0,
            "y"=> 0,
            "z"=> 0,
          );

//split the string to chars
$chars = str_split($s,1);

//do a loop and add increase the key by 1 for each found
echo "Total number of chars:" . count($chars) . "\n" ;
foreach ($chars as $c) {
    $key[$c] = $key[$c] +1; 
}
//loop through key
foreach ($key as $c=>$count){
    if($count>0){
        echo $c. '=>' . $count . "\n";
        //echo str_repeat($c, $count);
    }
    echo "\n";
}
?>
