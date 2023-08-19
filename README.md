# Nvim Lua Setup

<i>WARNING: This is a personal setup and may not work for everyone.</i>

## Instalation (MacOS)

1. Install lua-language-server : `brew install lua-language-server`
2. Create a `/nvim` folder in `.config`
3. Clone this repo
4. Link the repo to `.config/nvim`
```bash
ln -s ~/nvim-lua-config/lua .config/nvim/lua && ln -s ~/nvim-lua-config/README.md .config/nvim/README.md &&  ln -s ~/nvim-lua-config/init.lua .config/nvim/init.lua
```
6. Open and save `nvim .config/nvim/lua/jc/plugin.lua` to auto install plugins
8. Close and reopen to allow tree sitter to install
9. Use `:Mason` to install language servers you would like
10. Install prettier globally for formatting: `npm install -g prettier`
