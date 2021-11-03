git clone https://github.com/qt/qtbase.git
cd qtbase
git checkout %1
cd src\plugins\sqldrivers
qmake -- MYSQL_INCDIR="C:/Program Files/MariaDB 10.6/include/mysql" MYSQL_LIBDIR="C:/Program Files/MariaDB 10.6/lib"
nmake sub-mysql

