git clone https://github.com/qt/qtbase.git
cd qtbase
git checkout %1
cd src\plugins\sqldrivers
cmake . -DMySQL_INCLUDE_DIR="C:/Program Files/MariaDB 10.6/include/mysql" -DMySQL_LIBRARY="C:/Program Files/MariaDB 10.6/lib/libmariadb.dll" -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release
mingw32-make

