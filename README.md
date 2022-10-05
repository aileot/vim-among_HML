# vim-among_HML

vim-among_HML provides a set of motions, extending H/M/L motion.

## Demo

![among_HML#jump](https://user-images.githubusercontent.com/46470475/193440491-5fd405db-1f3e-4ad5-9e78-f31520a8859a.gif)

(In demo, [edluffy/specs.nvim](https://github.com/edluffy/specs.nvim) flashes
cursor.)

## Installation

Install the plugin using your favorite package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'aileot/vim-among_HML'
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use "aileot/vim-among_HML"
```

[dein.vim](https://github.com/Shougo/dein.vim) in toml

```toml
[[plugin]]
repo = 'aileot/vim-among_HML'
```

## Examples

### Vim script

```vim
" Assign a ratio (0.0 ~ 1.0) to jump within window.
:call among_HML#jump(1/8.0)  " Jump to 1/8 height in window.
:call among_HML#scroll(0.25) " Drag cursor line to 1/4 height in window.
```

If you prefer fraction to decimal, either numerator or denominator must be a
decimal in Vim script; otherwise, you would get an integer there.

- Either `1/4` or `3/4` results in `0`.
- `1/4.0` results in `0.25`, `3.0/4` results in `0.75`.

### Lua

```lua
require("among_HML").jump(1/8)
require("among_HML").scroll(0.25)
```

### Configuration

This plugin defines no default keymappings so that you should map keys by
yourself in your vimrc.

```vim
set scrolloff=0 " recommended (default)

" Jump into the line at 1/4 or 3/4 height of window (i.e., 25% or 75% height);
noremap K <Cmd>call among_HML#jump(0.25)<CR>
noremap J <Cmd>call among_HML#jump(0.75)<CR>

" Optional mappings with mnemonics:
" Get the Keyword
nnoremap gK K
xnoremap gK K
" <Space>-leaving Join in contrast to the default `gJ`
nnoremap <space>J J
xnoremap <space>J J
```

For more examples and information, please read
[documentation](https://github.com/aileot/vim-among_HML/blob/master/doc/among_HML.txt),
or `:h among_HML` in your Vim/Neovim)
