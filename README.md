# readtime.nvim
A neovim plugin - run `ReadTime` to display word count and estimated read time of your document.

## Install
```
{
  'rymdlego/readtime.nvim',
  config = function()
    require('readtime').setup()
  end
},
```

## Configuration
Set your desired word-per-minute value.
```
vim.g.readtime_options = { wpm = 240 }
```

## Usage
The plugin exposes the command `ReadTime`.
Run it from command mode or bind it to a key for convenience.
