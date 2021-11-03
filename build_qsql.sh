#!/bin/bash

if [ -z "$1" ]
then
  echo "No Qt version selected"
else
  echo "Qt version $1 selected"
  echo "$2 selected"
  
  git clone https://github.com/qt/qtbase.git
  cd qtbase
  git checkout "$1"
  cd src/plugins/sqldrivers
  if [ "$2" = "linux" ]
  then
    qmake -- MYSQL_INCDIR=/usr/include/mariadb/ MYSQL_LIBDIR=/usr/lib/x86_64-linux-gnu/
    make sub-mysql
  elif [ "$2" = "mac" ]
  then
    qmake -- MYSQL_INCDIR=/usr/local/include/mysql/ MYSQL_LIBDIR=/usr/local/lib
    make sub-mysql
  fi
fi
