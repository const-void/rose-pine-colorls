
# (c) 2024 const void*, free + open
#
# in ~/.zshrc:
#  source ./config/zsh/rose-pine-colorls/rose-pine-colorls.zsh
#  colorize_ls rose-pine-moon

# colorize_ls <theme>
function colorize_ls() {
  local theme_path=~/.config/colorls/themes
  local theme='rose-pine' #default

  # confirm theme, if provided, exists
  if [[ "${#}" -eq 1 ]]; then
    local theme_input=$1
    if [[ -f "${theme_path}/${theme_input}.yaml" ]]; then
      theme=${theme_input}
    fi
  fi

  local theme_file="${theme_path}/${theme}.yaml"
  
  #determine if light or dark -- assume light or dark is in theme some where
  local is_dark=$(grep -c "dark" "${theme_file}")
  

  local theme_type="light"
  if [[ ${is_dark} != "0" ]]; then #it's dark!
    theme_type="dark"
  fi

  export COLORLS_THEME=${theme_type}

  local theme_colorls_path=~/.config/colorls
  local theme_colorls="${theme_colorls_path}/${theme_type}_colors.yaml"

  ln -sf ${theme_file} ${theme_colorls}
}

# colorize_ls