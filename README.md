
# NeoVim IDE (Version 0.1.0)

A distribution of nvim, configured as an "Integrated" Development Environment (IDE).

### Features:

- Project Tree view
- Syntax Highting
- Auto Completion
- Search Project files, tags, and github history
- Debug your code
- Mouse support

### Requirements
- Stable internet connection
- Bash
- Sudo
- Supported OS

### Supported OS
Support OS means that I have tested this script on the following OS:

- Debian Stretch
- Debian Jessie
- Ubuntu 16.04
- KDE Neon 16.04


### Installation:
Installs the latest version of NeoVim and configures NeoVim to used as an IDE. You can install using either git, curl, or wget. Simply copy the following into your terminal.

**Using git:**
<pre>
git clone https://github.com/daniel-samson/neovim
cd neovim
chmod u+x ./install.sh
./install.sh
</pre>

**Using curl:**
<pre>
curl -si https://raw.githubusercontent.com/daniel-samson/neovim/master/install.sh| bash -s
</pre>

**Using wget:**
<pre>
wget -O - https://raw.githubusercontent.com/daniel-samson/vim/finstall-vim-ide.sh | bash
</pre>



## Usage:
- cd /path/to/project/
- vim # or gvim

### Quiting VIM IDE
Press &lt; Esc &gt; &lt; : &gt; &lt; q &gt; &lt;enter&gt;

### Key bindings
The key bindings start with the leader key, which is used to activate most plugins from normal mode. The leader key is currently bound to &lt; \ &gt;. Vim IDE follows the vim tradition of binding the first letter of the operation as a shortcut like eg. press &lt;LEADER&gt; p for **p**roject view.

#### Leader key
The leader key is curently the backslash ( \ ). You can easily change it in your .vim.user.settings
<pre>
" &lt;Leader&gt; key
let mapleader=','
</pre>

### Find Project Files
With the [Project Tree](https://github.com/daniel-samson/project-tree.vim) plugin you can view your project files by toggling the **p**roject view (&lt;LEADER&gt; &lt;P&gt;). This toggle vim built in file manager.

While the project tree is open
- Press &lt;ENTER&gt; to open
- Press &lt;V&gt; to  open in a new split window.
- Press &lt;F1&gt; for more commands

The [Nerd Tree](https://github.com/scrooloose/nerdtree) plugin also displays the
project tree, even after you have selected a file. Toggle the **N**erd Tree with (&lt;LEADER&gt; &lt;N&gt;) .

With the [fzf](https://github.com/junegunn/fzf.vim) plugin you can:
- **F**ind **F**iles (&lt;LEADER&gt; &lt;FF&gt;)
- **F**ind **W**ords (&lt;LEADER&gt; &lt;FW&gt;)
- **F**ind **Git** History  (&lt;LEADER&gt; &lt;FG&gt;)

You can use &lt;CTRL&gt; + &lt;T&gt; to open in a new tab (buffer), press &lt;ENTER&gt; to open, or &lt;CTRL&gt; + &lt;Q&gt; to quit.

With the [taglist](https://github.com/vim-scripts/taglist.vim) plugin you can toggle  the **L**ist of tags in file&lt;LEADER&gt; &lt;L&gt;)


### Managing opened files
Vim uses buffers to store each file which is opened. Use **F**ind **B**uffers (&lt;LEADER&gt; &lt;FB&gt;) to view and search your recently opened files. 

### Saving Files in VIM IDE
Vim IDE will auto save all your work. It also keeps the history of all the changes you have create in your ~/.vimhistory folder.

### Cut, Copy and Paste
Using the standard vim keys to manage your system clipboard, in all modes except insert you can:

- **X**Cut &lt;X&gt;
- **Y**ank (Copy) &lt;Y&gt;
- **P**aste &lt;P&gt;

### More editing
- Jump to definition &lt;CTRL&gt; + &lt;]&gt;
- - Show Tags (Insert Mode) &lt;CTRL&gt; + &lt;P&gt; or &lt;CTRL&gt; + &lt;N&gt;
- Move line up (Insert Mode) &lt;CTRL&gt; + &lt;K&gt;
- Move line down (Insert Mode) &lt;CTRL&gt; + &lt;J&gt;

** PHP Actor Only: **

- (Normal Mode) Jump to definition &lt;LEADER&gt; + &lt;]&gt;
- (Normal Mode) Find Reference &lt;LEADER&gt; + &lt;FR&gt;
- (Visual Mode) Extract Method &lt;LEADER&gt; + &lt;EM&gt;

### Window Navigation
- Switch to window below &lt;ALT&gt; + &lt;J&gt;
- Switch to window above &lt;ALT&gt; + &lt;K&gt;
- Switch to left window  &lt;ALT&gt; + &lt;H&gt;
- Switch to right window &lt;ALT&gt; + &lt;L&gt;

### Git
With projects which use git, vim ide will display the changes in the gutter and in the airline bar.

### Undo history
With the [Gundo](https://github.com/sjl/gundo.vim) plugin you can see your active undo history. Use &lt;LEADER&gt; + &lt;U&gt; to toggle your undo history. You history for all your projects are kept in the .vimhistory directory in your home folder.

### Autocompletion
Auto completion is enabled out-of-the-box via &lt;CTRL&gt; + &lt;P&gt; and &lt;CTRL&gt; + &lt;N&gt; in insert mode. In order to get the best experience, you need to create an index for your project:

Please note that the ctags index is not automatically managed, so you will need to re run the ctags command in order to keep your index updated.

You can also use make index command:
<pre>
:MakeIndex
</pre>

Shortcut is (&lt;LEADER&gt; &lt;M&gt;)

Then you can use the omnicompletion in insert mode(&lt;CTRL&gt; + &lt;X&gt; &lt;CTRL&gt; + &lt;O&gt;) to auto complete your syntax.

### Themes
The themes have two modes a light and dark. To change the mode 
<pre>
:set background=light 
</pre>

<pre>
:set background=dark
</pre>

To make it permanent you can add one of these commands to your ~/.vimrc start up file.

### Commands
- **MakeIndex** -  Runs ctags -R for autocompletion
- **IdeVersion** - displays the version of this script
- ! &lt;terminal command&gt; runs a terminal command so you don't need to leave vim

### Debugging: 

With the [vdebug](https://github.com/joonty/vdebug) plugin, You can set up any DBGP protocol debugger, e.g. Xdebug. (See :help VdebugSetUp). Start Vdebug with `<F5>`, which will make it wait for an incoming connection. Run the script you want to debug, with the debugging engine enabled. A new tab will open with the debugging interface.

Once in debugging mode, the following default mappings are available:

 * `<F4>`: detach script from debugger
 * `<F5>`: start/run (to next breakpoint/end of script)
 * `<F6>`: stop debugging (kills script)
 * `<F7>`: step into
 * `<F8>`: step over
 * `<S-F8>`: step out
 * `<F9>`: run to cursor
 * `<F10>`: toggle line breakpoint
 * `<F11>`: show context variables (e.g. after "eval")
 * `<F12>`: evaluate variable under cursor
 * `:Breakpoint <type> <args>`: set a breakpoint of any type (see :help VdebugBreakpoints)
 * `:VdebugEval <code>`: evaluate some code and display the result
 * `<Leader>e`: evaluate the expression under visual highlight and display the result

To stop debugging, press `<F4>`. Press it again to close the debugger interface.

If you can't get a connection, you will set up your environment. Type `:help Vdebug` for more information.


### Troubleshoot XDebug
Ensure you have xdebug installed
<pre>
sudo apt get install php-xdebug or php5-xdebug
</pre>

Ensure that you have configured xdebig php.ini or in the x-debug config file:
<pre>
xdebug.remote_enable=On;
xdebug.remote_host="localhost;"
xdebug.remote_port=9000;
xdebug.remote_handler="dbgp"; 
</pre>

When you can't configure xdbbug via php use this method instead edit the .bashrc
<pre>
vim ~/.bashrc
</pre>
add to the end of the file:
<pre>
export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1 remote_connect_back=0"
</pre>