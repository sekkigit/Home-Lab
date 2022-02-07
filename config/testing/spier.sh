#!/bin/bash

update(){
  echo "Installing"
  load &
  pid=$!

  for i in $(bash ./config/update_os.sh &> /dev/null)
  do
    sleep 1;
  done

  kill $pid
  echo ""
}

load(){
  while [ 1 ]
  do
    echo -ne ".";
    sleep 0.2;
  done
}

update



clear
spinner=( Ooooo oOooo ooOoo oooOo ooooO oooOo ooOoo oOooo);
 
count(){
  spin &
  pid=$!

  for i in $(bash ./config/update_os.sh &> /dev/null)
  do
    sleep 1;
  done

  kill $pid
}

spin(){
  while [ 1 ]
  do
    for i in ${spinner[@]};
    do
      echo -ne "\r$i";
      sleep 0.2;
    done;
  done
}

count