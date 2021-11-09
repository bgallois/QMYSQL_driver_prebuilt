## QMYSQL driver pre-built

<p float="left">
  <img src="https://mariadb.com/kb/static/images/logo-2018-black.95f5978ae14d.png" width="100" />
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Qt_logo_2016.svg/langfr-220px-Qt_logo_2016.svg.png" width="100" /> 
</p>

Since the Qt Company doesn't ship the MYSQL/MARIADB SQL driver with the Qt binaries "[Due to the practicalities of dealing with external dependencies, only the SQLite plugin is shipped with binary builds of Qt](https://doc.qt.io/qt-6/sql-driver.html#qmysql)", it has to be built manually. This repository provides scripts to build the driver and precompiled binaries for Windows, Linux, and macOS.

### Automatic compilation

* Fork the GitHub repository.
* Checkout on the desired branch (qt5 or qt6).
* Change the Qt version in `.github/workflows/build.yml`.
* Get the binaries in the GitHub Actions artifacts.

### Manual compilation

* Install the necessary dependencies for [MariaDB](https://mariadb.com/kb/en/compiling-mariadb-from-source/).
* Call the script with the Qt version as a parameter
    ```
    ./build.sh 5.15.2
    ```
	or
    ```
    ./build_win.sh 5.15.2
    ```


### Deployment

* Put the libqsqlmysql.so, libqsqlmysql.dylib or qsqlmysql.dll in folder `plugins/sqldriver` inside the Qt installation or alongside the executable (application deployment). 
* Put libmariadb.so, libmariadb.dylib or libmariadb.dll alongside the application executable (necessitates OpenSSL libraries).
