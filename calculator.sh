while true
do 
  echo "1.add "
  echo "2.subtract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"
  read -p "enter the operation: " choice

  if [ $choice -eq 1 ]
  then
    read -p "enter the first number: " number1
    read -p "enter the seconed number: " number2
    echo the result= $(($number1 + $number2))
   elif [ $choice -eq 2 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 - $number2 ))
  elif [ $choice -eq 3 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 * $number2 ))
  elif [ $choice -eq 4 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 / $number2 ))
  elif [ $choice -eq 5 ]
  then
    break
  fi

done