#data types 
#!/bin/bash
var1=10
var2=20
var3=siva
echo "$var1+$var2" # u didnt get out put as you expect this will display $var1+$var2
echo "$(($var1+$var2+$var3))"

#declaring the count 

declare -i COUNT=5
 COUNT=COUNT+1
 echo "Count is:$COUNT"
 #decalring the Array
FRUITS=("Apple" "Banana" "Orange")
echo "All fruits : ${FRUITS[@]}"
echo "fruit index1 : ${FRUITS[1]}"
echo "fruit index2 : ${FRUITS[2]}"

# dispaly name 
name="Thulasiram"
echo "My name is : ${name}"





