#!/bin/bash

if [ -z "$1" ]
then
  echo "No Qt version selected"
else
  echo "Qt version $1 selected"
  
  git clone https://github.com/qt/qtbase.git
  cd qtbase
  git checkout "$1"
  cd src/plugins/sqldrivers

  git clone https://github.com/MariaDB/server.git
  cd server
  git checkout 10.6
  mkdir build
  cd build/
  cmake .. -Wno-dev
  make
  make DESTDIR=rel install
  cd ../..

  qmake -- MYSQL_INCDIR=$PWD/server/build/rel/usr/local/mysql/include/mysql/ MYSQL_LIBDIR=$PWD/server/build/rel/usr/local/mysql/lib/
  make sub-mysql
  mkdir mariadb_driver
  cp -r plugins/ mariadb_driver/
  cp server/build/rel/usr/local/mysql/lib/libmariadb* mariadb_driver/
fi
