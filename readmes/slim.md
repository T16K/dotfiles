# [SLiM](https://wiki.archlinux.org/title/SLiM)

## Enabling SLiM

```bash
# systemctl enable slim.service
```

## Environments

To configure SLiM, edit both `/etc/slim.conf`:
```
# Set directory that contains the xsessions.
# slim reads xsession from this directory, and be able to select.
# sessiondir            /usr/share/xsessions/

default_user        t1k

current_theme       archlinux
```

### Custom Background

```bash
# sudo cp Wallpapers/bedroom.jpg /usr/share/slim/themes/archlinux/background.png 
```

## Tips

You may shutdown, reboot or even launch a terminal from the SLiM login screen. To do so, use the values in the username field, and the root password in the password field:
- To launch a terminal, enter **console** as the username
- For shutdown, enter **halt** as the username
- For reboot, enter **reboot** as the username

## CLI Environment

Press `Ctrl + Alt + F1`.
