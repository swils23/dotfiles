help:
	@echo ""
	@echo "Available Commands:"
	@echo "check    - Check the status"
	@echo "install  - Install everything in the playbook"
	@echo "dotfiles - Symlink all the dotfiles"
	@echo "facts    - List facts"
	@echo ""

check:
	ansible-playbook -i  hosts playbook.yml --check --diff -c local

install:
	@echo "Choose your OS:"
	@echo "1. MacOS"
	@echo "2. Ubuntu"
	@read -p "Enter your choice: " choice; \
	if [ $$choice -eq 1 ]; then \
		ansible-playbook -i hosts playbook.yml -c local --tags "dotfiles,brew,python,macos"; \
	elif [ $$choice -eq 2 ]; then \
		ansible-playbook -i hosts playbook.yml -c local --tags "dotfiles,brew"; \
	else \
		echo "Invalid choice"; \
	fi


dotfiles:
	ansible-playbook -i hosts playbook.yml -c local --tags dotfiles

facts:
	ansible all -i hosts -m setup -c local