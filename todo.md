# TODO
- experiment with coc-nvim and vimspector etc. to decide if native is really
  worth it.
- consider [https://github.com/ray-x/go.nvim]
- consider nvim-surround / mini.surround
- do I really need Neorg?
- stable install from scratch (yaml cli for nvim-java, neorg ts parser...)
- keybind logical groups
- make debugpy work without having to install it into the virtual env of the
  code
- make pylsp work without activating project venv shell
- use noice to remove escape characters in lsp hover?
- try vGit plugin
- better python lsp configuration, a la lazyvim
- set messagesopt? use noise to hide hit enter prompts?
  - messageopt still flashes cmd output even with wait:0
- do I really need a plugin for statuscol
- fix bullets.vim keymappings
- consider oil.nvim

- [x] convert to lazyvim plugin management
- [x] quickfix opens twice when using Ctrl-q telescope
- [x] fix lazy loading
- [x] consolidate key mappings
- [x] gr is slow because grr exists

## Java

### lemminx-maven
- Would have to actually create a Mason registry in github with actions to
  compile the registry and relases if I wanted it to be ergonomic
- might as well just have my own lua module that installs the package for me
  - alternatively, it would be nice to contribute to mason or nvim-java

- [x] use Mason 2.0 if nvim-java supports it
- Lemminx patched for maven
  - options
    * mason package via github jar, seperate repo
    * mason package via jar, nvim repo
      + can those even have the jars moved?
    * mason registries can be configured to run build commands, so download the
      repo and run the build command?
    * combined lemminx + lemminx maven
- vscode-maven integration
  - Mason package
