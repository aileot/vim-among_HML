# vim-among_HML

vim-among_HML provides a set of motions, extending H/M/L motion.

## Demo

![among_HML#fork](https://user-images.githubusercontent.com/46470475/71517891-7b5bd000-28f3-11ea-8ee4-3a72a1888541.gif)

In demo, type `K` to 1/4 height of lines in window and `J` to 3/4.
Addition to them, `KK` in sequence will jump 1/4 at first, and then, to 1/8;
`KJ` to 3/8; `JK` to 5/8; `JJ` to 7/8.

You can copy the keymappings in doc/among_HML.txt;
type `:help among_HML-example` in commandline of vim.
[kana/vim-submode](https://github.com/kana/vim-submode)
is necessary for the use in sequence.

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

## Notice

If you prefer fraction to decimal,
either numberator or denominator must be a decimal.

In Vim/Neovim, a ratio of Integers is an Integer:

- Either `1/4` or `3/4` results in `0`.
- `1/4.0` results in `0.25`, `3.0/4` results in `0.75`.

## Examples

```vim
" Assign a ratio (0.0 ~ 1.0) to jump within window.
:call among_HML#jump(1/8.0) " Jump to 1/8 height in window.
:call among_HML#scroll(0.25) " Drag cursor line to 1/4 height in window.
```

or, in Lua

```lua
require("among_HML").jump(1/8)
require("among_HML").scroll(0.25)
```

vim-among_HML defines no default keymappings;
so you should define some keymappings, like the examples below,
in your vimrc or init.vim.

```vim
set scrolloff=0 " recommended (default)

" Jump into the line at 1/4 or 3/4 height of window (i.e., 25% or 75% height);
noremap <silent> K <Cmd>call among_HML#jump(0.25)<CR>
noremap <silent> J <Cmd>call among_HML#jump(0.75)<CR>

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
