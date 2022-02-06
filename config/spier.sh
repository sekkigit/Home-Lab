#!/bin/bash

install(){
  echo "Instaling"
  load &
  pid=$!

  for i in "bash update_os.sh"
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

install