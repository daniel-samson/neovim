Key Bindings
====

This project tries to use the g key instead of the leader key. 

## Navigating your project
Inspired by vscode. Pressing `gp` will let you find file in your project. Pressing `g SHIFT + P` will let you find commands.

Press `gf` to find text in your opened file/buffer. Press `gF` To fuzzy find text in your project files.

Press `gl` to find or select currently opened files/buffers.

Press 'go' to open the project explorer relative to the opened file/buffer. Press `g SHIFT + O` to open the project explorer from the root of your project.

## Text Editing

*While in NORMAL mode or VISUAL mode*:

Selection is done via `SHIFT + Arrow Key`. To select all you can use `g SHIFT + A`. This helps to reduce the frustration for new vim users.

Disabling the highlight can be done by double tapping the `\` key.

Indentation is done using `TAB` and `SHIFT + TAB`.

To duplicate a line use `gd`.

To move a line down use `gj`.

To move a line up use `gk`.

pressing `CARRIAGE RETURN` will create a new line at the point of the cursor and put you into INSERT MODE.

pressing `BACKSPACE` will remove the last character and put you into INSERT MODE.

## Auto completion

While in INSERT mode CoC will present you with a menu as you are typing. Use the `CARRIAGE RETURN` key to select the first selection or the next selection. Use the `TAB` key to change the selection. You can also press `CTRL + SPACE` to bring up the menu.

## Toggle Comments
While in INSERT mode, Press `gcc` to toggle comment out code.

## Renaming indentifier
While in NORMAL mode, Press `gr` to rename a symbol.

## Go To
While in NORMAL mode:

- Press `gtd` go to definition
- Press `gtr` go to reference
- Press `gtt` go to type definition
- Press `gti` go to implementation

## Code Action
In NORMAL mode, Coc tries to lint you code. To fix the issues Press `ga`

## Format Code
In NORMAL mode, Press `=` to format your code

## Getting Help
In NORMAL mode, Press `SHIFT + K`.

## Copy Path
To copy the path of the current file (file), press `gs` to copy the relative path, press `g SHIFT + S` to get the full path.
