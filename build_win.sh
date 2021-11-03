#!/bin/bash

## NEED VS x64 Native toolset https://docs.microsoft.com/en-us/cpp/build/how-to-enable-a-64-bit-visual-cpp-toolset-on-the-command-line?view=msvc-160

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
  mkdir build_win
  cd build_win/
  cmake .. -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX="$PWD/rel"
  nmake
  nmake install
  cd ../..

  qmake -- MYSQL_INCDIR="$PWD/server/build_win/rel/include/mysql/" MYSQL_LIBDIR="$PWD/server/build_win/rel/lib/"
  nmake sub-mysql
  mkdir mariadb_driver
  cp -r plugins/ mariadb_driver/
  cp server/build_win/rel/usr/local/mysql/lib/libmariadb* mariadb_driver/
fi
