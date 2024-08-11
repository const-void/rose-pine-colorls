# rose-pine-colorls template source
All natural pine, faux fur and a bit of soho vibes for the classy minimalist

# Install
1. Clone this repo
```zsh
$ git clone https://github.com/const-void/rose-pine-colorls
$ cd rose-pine-colorls
$ make install
```

2. Add to `~/.zshrc`, tweaking as you like
```zsh
$ vi ~/.zshrc
...
source ./config/zsh/rose-pine-colorls/rose-pine-colorls.zsh
colorize_ls rose-pine
alias ls="colorls --${COLORLS_THEME}"
...
```

## included themes
```zsh
colorize_ls rose-pine
colorize_ls rose-pine-moon
colorize_ls rose-pine-dawn
```

# Functions
`colorize_ls <theme-name>` - configure colorls to use given theme.

## how colorize_ls works
each theme is a `yaml` file in `~/.config/colorls/themes`, a directory created by us.  `colorize_ls` confirms `<input parameter>.yaml` exists in that directory, and if it does, tries to determine if the theme is `light` or `dark` by `grepping` for the word dark. 

Next, the function creates a symbolic link from the colorls `light_colors.yaml` or `dark_colors.yaml` to the parameterized `theme.yaml`.  From there, it sets `${COLORLS_THEME}` to `dark` or `light`, so that the relevant parameter can be set from alias/functions etc.

# Environment Variables
`${COLORLS_THEME}` -- either `light` or `dark`.

# Tips n Tricks

## no make?
Makefile is just `sh` statements, try running relevant lines manually.

## Customize rose-pine template
Install rose-pine template builder, tweak `src/colorls-template.yaml` then `make`
```zsh
$ npx install @rose-pine/build
$ npx @rose-pine/build --help #confirm successful install
$ git clone https://github.com/const-void/rose-pine-colorls
$ cd rose-pine-colorls
$ vi ./src/colorls-template.yaml
...
edits
...
$ make
$ make install
```

## Post install - customize with your own template
Assuming you have already installed, copy a starting place, tweak, try it out in real-time!
```zsh
$ cd ~/.config/colorls/themes
$ cp rose-pine.yaml your-theme.yaml
$ vi your-theme.yaml
...
edits - remember to include the word dark or light! 
...
$ colorize_ls your-theme
$ ls
```

Once you are happy, remember to add `colorize_ls your-theme` to your `~/.zshrc`!

Have fun theming! 

## Thanks to
- [bietdoikiem](https://github.com/bietdoikiem) for https://github.com/bietdoikiem/colorls 
- 