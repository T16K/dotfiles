# [qutebrowser](https://wiki.archlinux.org/title/Qutebrowser)

## Translate page
To translate the current page simply to
```
spawn --userscript translate
```
By default the source language will be automatically detected and the target language will be English.
To specify other languages use the arguments `-s/--source` and `-t/--target`. For example to translate from German to Swedish do
```
spawn --userscript translate -s de -t sv
```
