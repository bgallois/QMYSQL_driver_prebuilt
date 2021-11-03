## qt_mariadb_driver

Since the Qt Company doesn't ship the qsqlmysql SQL driver with the Qt binaries, it has to be built manually. This repository provides scripts to build the driver and precompiled binaries for Windows, Linux, and macOS.

### Compilation

Call the script with the Qt version as a parameter.
```
./build 5.15.2
```
```
./build_win 5.15.2
```

### Deployement

* Put the qsqlmysql.so or qsqlmysql.dll in the application folder `plugins/sqldriver`
* Put libmariadb.so or libmariadb.dll alongside the application executable alongside OpenSSL v1.1 libraries.
