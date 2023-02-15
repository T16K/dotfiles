# A Full Walkthrough of My LaTeX Setup

This README serves as a reminder of my neovim settings for notes in LaTex.

## Editor Setup

- Editor: [neovim](https://github.com/neovim/neovim) - A fork of [Vim](https://github.com/vim/vim) aiming to improve the codebase, allowing for easier implementation of APIs, improved user experience and plugin implementation.

- vim/neovim plugin involved:
    - [Auto Pairs](https://github.com/jiangmiao/auto-pairs): Insert or delete brackets, parens, quotes in pair.
    - [goyo.vim](https://github.com/junegunn/goyo.vim): Distraction-free writing.
    - [indentLine](https://github.com/yggdroot/indentline): Display the indention levels with thin vertical lines.
    - [ligthline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline.
    - [limelight.vim](https://github.com/junegunn/limelight.vim): Hyperfocus-writing
    - [quick-scope](https://github.com/unblevable/quick-scope): Lightning fast left-right movement.
    - [Tabular](https://github.com/godlygeek/tabular): text filtering and alignment.
    - [UltiSnips](https://github.com/SirVer/ultisnips) - the ultimate solution for snippets.
    - [commentary.vim](https://github.com/tpope/vim-commentary): Comment stuff out.
    - [vim-polyglot](https://github.com/sheerun/vim-polyglot): A solid language pack.
    - [vim-visual-multi](https://github.com/mg979/vim-visual-multi): Multiple cursors.
    - [vimtex](https://github.com/lervag/vimtex) - a modern Vim and Neovim filetype and syntax plugin for LaTeX files.

- [To see the configurations of each plugin.](https://github.com/T16K/dotfiles/blob/main/dotfiles/config/nvim/init.vim)

## Starting a New Document

I have 2 ways to start a new document.

1. If the document I wish to prepare is a note-like document (lecture notes, reading notes, etc.), I jump into my [directory](https://github.com/T16K/usp) and run
```bash
./template/newnote.sh "my-new-note"
```
- Once that is in place I begin creating a file in directory `sections`.

2. If the document I wish to prepare is just a generic .tex file without any complicated setup or a .tex slide, then I just start editing a new .tex file. 
- In this case, I start writing `template` and hit `tab`.
- Or writing `slide` and hit `tab`.

## Snippets

Note: To move from `$1` to `$0` in a .tex file hit `tab`.

- `input`:
```
\input{sections/$0}
```

- `lect`:
```
\lecture{$1}{$2}{$0}
```

- `chap`:
```
\chapter{$0}
```

- `sect`:
```
\section{$0}
```

- `subsec`:
```
\subsection{$0}
```

- `beg`:
```
\\begin{$1}
	$0
\\end{$1}
```

- `table + tab`:
```
\begin{table}[${1:htpb}]
	\centering
	\caption{${2:caption}}
	\label{tab:${3:label}}
	\begin{tabular}{${5:c}}
	$0${5/((?<=.)c|l|r)|./(?1: & )/g}
	\end{tabular}
\end{table}
```

- `fig + tab`:
```
\begin{figure}[${1:htpb}]
	\centering
	${2:\includegraphics[width=0.8\textwidth]{$3}}
	\caption{${4:$3}}
	\label{fig:${5:${3/\W+/-/g}}}
\end{figure}
```

- `enum`:
```
\begin{enumerate}
	\item $0
\end{enumerate}
```

- `item`:
```
\begin{itemize}
	\item $0
\end{itemize}
```

- `pac + tab`:
```
\usepackage[${1:options}]{${2:package}}$0
```

[To see all snippets.](https://github.com/T16K/dotfiles/blob/main/dotfiles/config/nvim/tex.snippets)

## List of Commands

### Goyo

- `:Goyo`
    - Toggle Goyo
- `:Goyo!`
    - Turn Goyo off
- The window can be resized with the usual `[count]<CTRL-W>` + `>`, `<`, `+`, `-` keys, and `<CTRL-W>` + `=` will resize it back to the initial size.

### Limelight

- `:Limelight [0.0 ~ 1.0]`
    - Turn Limelight on
- `:Limelight!`
    - Turn Limelight off
- `:Limelight!! [0.0 ~ 1.0]`
    - Toggle Limelight

### quick-scope

- When moving across a line, the <kbd>f</kbd>, <kbd>F</kbd>, <kbd>t</kbd> and <kbd>T</kbd> motions combined with <kbd>&lt;char&gt;</kbd> moves your cursor to <kbd>&lt;char&gt;</kbd>.

### Tabular

- `:Tab /<kbd>&lt;char&gt;</kbd>`

### commentary.vim

- `gcc`
	- Comment out a line
- `gcap`
	- Comment out a paragraph
- `gc` in visual mode
	- Comment out the selection
- `gcgc`
	- Uncomments a set of adjacent commented lines

### vim-visual-multi

Basic usage:

- select words with <kbd>Ctrl-N</kbd> (like `Ctrl-d` in Sublime Text/VS Code)
- create cursors vertically with <kbd>Ctrl-Down</kbd>/<kbd>Ctrl-Up</kbd>
- select one character at a time with <kbd>Shift-Arrows</kbd>
- press <kbd>n</kbd>/<kbd>N</kbd> to get next/previous occurrence
- press <kbd>[</kbd>/<kbd>]</kbd> to select next/previous cursor
- press <kbd>q</kbd> to skip current and get next occurrence
- press <kbd>Q</kbd> to remove current cursor/selection
- start insert mode with <kbd>i</kbd>,<kbd>a</kbd>,<kbd>I</kbd>,<kbd>A</kbd>

Two main modes:

- in _cursor mode_ commands work as they would in normal mode
- in _extend mode_ commands work as they would in visual mode
- press <kbd>Tab</kbd> to switch between «cursor» and «extend» mode

### VimTeX

- Press `\ll` to start (or stop) compiling the document.
	- This turns on automatic compiling if supported by your compiler, meaning your document will be compiled each time you save.

- Press `\lk` to stop the compilation process

- Press `\lc` to clear auxiliary files.


## Writng a File
```
\lecture{1}{01 jan 2023}{Introdução}

\setcounter{chapter}{-1}
\chapter{Introdução}

\section{Introdução}

\begin{itemize}
    \item item
\end{itemize}

\begin{defi}
    Definição
\end{defi}

\begin{ex}
    Exemplo
\end{ex}

\begin{nota}
    Nota
\end{note}

\begin{perg}
    Pergunta
\end{perg}

\begin{prova}
    Prova
\end{prova}

\begin{exemplo1}
    Exemplo
\end{exemplo}

\begin{nota1}
    Nota
\end{nota}

\begin{exemplo2}
    Exemplo
\end{exemplo}

\begin{nota2}
    Nota
\end{nota}
```

## Inkscape

To add a figure, type the title on a new line, and press <kbd>Ctrl+F</kbd> in insert mode.
This does the following:

1. Find the directory where figures should be saved depending on which file you're editing and where the main LaTeX file is located, using `b:vimtex.root`.
1. Check if there exists a figure with the same name. If there exists one, do nothing; if not, go on.
1. Copy the figure template to the directory containing the figures.
1. In Vim: replace the current line – the line containing figure title – with the LaTeX code for including the figure.
1. Open the newly created figure in Inkscape.
1. Set up a file watcher such that whenever the figure is saved as an svg file by pressing <kbd>Ctrl + S</kbd>, it also gets saved as pdf+LaTeX.

To edit figures, press <kbd>Ctrl+F</kbd> in command mode, and a fuzzy search selection dialog will popup allowing you to select the figure you want to edit.
