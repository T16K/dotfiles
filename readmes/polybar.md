# [Polybar](https://wiki.archlinux.org/title/Polybar)

## Settings

[bar/top]
modules-left = launcher title decor1 decor2 workspaces decor1 decor2 color-switch decor1
modules-right = decor4 updates decor3 decor4 temperature battery keyboard decor3 decor4 date sysmenu

[bar/bottom]
modules-left = mpv decor3 decor4 cpu memory filesystem decor3
modules-right = decor2 network decor1 decor2 alsa backlight

### [module/backlight]
Use the following command to list available cards:
```
$ ls -1 /sys/class/backlight/
```

### [module/battery]
Use the following command to list batteries and adapters:
```
$ ls -1 /sys/class/power_supply/
```

### [module/network]
Use the following command to list networks:
```
$ ip a
```

### [module/temperature]
To list all the zone types, run: 
```
$ for i in /sys/class/thermal/thermal_zone*; do echo "$i: $(<$i/type)"; done
```

Use `sensors` to find preferred temperature source, then run:
```
$ for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done
```
