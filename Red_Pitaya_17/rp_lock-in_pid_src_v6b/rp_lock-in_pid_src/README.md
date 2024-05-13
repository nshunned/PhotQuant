# Red Pitaya Lock-in+PID Application

The project was forked from: https://marceluda.github.io/rp_lock-in_pid

It is currently stored in `S:\Programmation\RedPitaya\rp_lock-in_pid`

# Compile / implementation HELP

Run on terminal:

```
$ source settings.sh
$ make
```

Or form App folder `lock_in+pid` :

```
$ source ../settings.sh
```

and then...

For web controller C code compiling:

```
$ make app
```

For FPGA implementation:

```
$ make fpga
```

For zip packaging

```
$ mkdir -p ../archive
$ make zip
```

For tar.gz packaging

```
$ mkdir -p ../archive
$ make tar
```

For cleaning:

```
$ make clean       # clean all
$ make clean_app   # clean only C objects
$ make clean_fpga  # clean only FPGA implementation temp files and .bin
```

# Upload App to Red Pitaya device

UnZip / UnTar the App folder. Execute from terminal:

```
$ ./upload_app.sh rp-XXXXXX.local
```

Replace `rp-XXXXXX.local` by your RP localname or IP address

Also, you can use your own SSH client and upload the lock_in+pid folder the the
RedPitaya folder: `/opt/redpitaya/www/apps`
