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