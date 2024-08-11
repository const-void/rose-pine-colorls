all: theme

theme:
	npx @rose-pine/build -f hex -t ./src/colorls-template.yaml -o ./dist/

install:
	@echo "Installing..."
	@mkdir -p ~/.config/colorls/themes
	@cp ./dist/*.yaml  ~/.config/colorls/themes
	@mkdir -p ~/.config/zsh/rose-pine-colorls
	@cp ./script/*zsh ~/.config/zsh/rose-pine-colorls
	@echo "Installed!"
	@echo " "
	@echo "Activation:"
	@echo " 1. update ~/.zshrc:"
	@echo "       source ~/.config/zsh/rose-pine-colorls/rose-pine-colorls.zsh"
	@echo "       colorize_ls rose-pine"
	@echo " "
	@echo " 2. add COLORLS_THEME variable to alias/functions"
	@echo " "
	
clean:
	rm -f dist/*.yaml