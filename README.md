# tedious

Some tedious checks

only tested in `Arch linux 4.14.13-1-ARCH`

### INSTALL
```sh
sudo ln -fs $(pwd)/tedious.sh /bin/tedious ; sudo chmod +x /bin/tedious
```

### USAGE
```usage
  -h | --help     Help
  -v | --verbose  Verbose activate
  -p | --print    Some infos about system, possible parameters: (Use verbose for more info)
                      "video"   Video Board Info
                      "mother"  Mother Board Info
                      "sound"   Sound Board Info
                      "proc"    Processor Info
                      "mem"     Memory info
```
