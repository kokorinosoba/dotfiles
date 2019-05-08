DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore .gitmodules .DS_Store
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:

list: ## Show dotfiles in this repo
	@#$(foreach VAR,LIST,TEXT): LISTの要素をVARに分解しTEXTで展開して実行する
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@#$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@./bin/symlink -f
	@echo ''

init: ## Setup environment settings
	@#DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh
	@./etc/init/initialize.sh

test: ## Test dotfiles and init scripts
	@#DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh
	@echo "test will be ready to use in the future..."

update: ## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install: update deploy init ## Run make update, deploy, init
	@exec $$SHELL

clean: ## Remove the dotfiles and this repo
	@echo '==> Remove dotfiles in your home directory...'
	@./bin/symlink -d

help: ## Self-documented Makefile
	@echo -e 'This script was forked from \e[1;36mhttps://github.com/b4b4r07/dotfiles\e[0m'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
