#! /bin/bash
let a=5+4
echo $a

let "a=5+4"
echo $a

let a++
echo $a

let 'a=4*5'
echo $a

let "a=$a+30"
echo $a

expr 11 % 2
