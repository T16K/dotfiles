# [Zathura](https://wiki.archlinux.org/title/Zathura)

## Default pdf Viewer

Ensures, for example, that xdg-open will open pdf files with zathura.

First, ensure a desktop entry for zathura exists at `/usr/share/applications/org.pwmt.zathura.desktop`. If it does not, download the desktop entry from from the zathura repo to `/usr/share/applications/org.pwmt.zathura.desktop`.
```bash
$ xdg-mime default org.pwmt.zathura.desktop application/pdf
```

## Features

- Adjust the document to page-fit (`a`)
- Adjust the document to fit width (`s`)
- Rotate pages (`r`)
- View pages side-by-side (`d`)
- Recolored to have a black background and white foreground (`Ctrl+r`)
- Most of vi's movement/scrolling commands are supported
