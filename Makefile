# source:
#  - https://code.visualstudio.com/api/working-with-extensions/publishing-extension
#  - https://github.com/microsoft/vscode-vsce/issues/11
#  - https://dev.azure.com/sugatoray/_usersSettings/tokens
#  
# manage vscode extensions: 
#  - https://marketplace.visualstudio.com/manage/publishers/sugatoray

.PHONY: help move build publish release 

.PHONY: vsce.open vsce.token vsce.metadata

VSCE_PUBLISHER := sugatoray
VSCE_NAME := vscode-markdown-extension-pack
VSCE_EXTENSION_URL := https://marketplace.visualstudio.com/items?itemName=$(VSCE_PUBLISHER).$(VSCE_NAME)
VSCE_MANAGEMENT_URL := https://marketplace.visualstudio.com/manage/publishers/$(VSCE_PUBLISHER)
VSCE_TOKEN_URL := https://dev.azure.com/$(VSCE_PUBLISHER)/_usersSettings/tokens
PYTHON := python3

help:
	@echo "\n Makefile Commands' Help\n"
	# Commands:
	#
	# move			    :	Move the .vsix artifact(s) under .artifacts folder.
	# build			    :	Build the extension (creates a.vsix file).
	# publish		    :	Publish the extension.
	# release 		    :	Build and Publish the extension.
	# vsce.open		    :	Opens the VS Code Extension Management page for a Publisher.
	# vsce.token		:	Opens the Azure DevOps Page to Manage the Personal Access Token for VSCE.
	# vsce.metadata     :	Fetches extension metadata
	# vsce.extn			:	Opens the Marketplace Extension Page in Browser

############################## ..: COMMANDS s:.. ################################

move:
	@echo "\n Moving .vsix files to .artifacts folder... ⏳\n"
	mv *.vsix ./.artifacts/

build:
	@echo "\n🔥⚙️ Packaging... ⏳\n"
	vsce package

publish:
	@echo "\n📘📄 Publishing... ⏳\n"
	vsce publish

release: build move publish
	@echo "\n✨ Releasing... ⏳\n"

vsce.open:
	@echo "\n✨ Open VS Code Extension Manager in Browser... ⏳\n"
	$(PYTHON) -c "import webbrowser; webbrowser.open('$(VSCE_MANAGEMENT_URL)')"

vsce.token:
	@echo "\n✨ Open VS Code Extension Token Manager in Browser... ⏳\n"
	$(PYTHON) -c "import webbrowser; webbrowser.open('$(VSCE_TOKEN_URL)')"

vsce.metadata:
	@echo "\n✨ Show VS Code Extension Metadata... ⏳\n"
	vsce show $(VSCE_PUBLISHER).$(VSCE_NAME)

vsce.extn:
	@echo "\n✨ Open VS Code Extension Marketplace in Browser... ⏳\n"
	$(PYTHON) -c "import webbrowser; webbrowser.open('$(VSCE_MANAGEMENT_URL)')"
