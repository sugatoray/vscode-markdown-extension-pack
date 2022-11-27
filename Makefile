# source:
#  - https://code.visualstudio.com/api/working-with-extensions/publishing-extension
#  - https://github.com/microsoft/vscode-vsce/issues/11
#  - https://dev.azure.com/sugatoray/_usersSettings/tokens
#  
# manage vscode extensions: 
#  - https://marketplace.visualstudio.com/manage/publishers/sugatoray

.PHONY: help move build publish release vsceopen vscetoken

VSCE_PUBLISHER := sugatoray
VSCE_MANAGEMENT_URL := https://marketplace.visualstudio.com/manage/publishers/$(VSCE_PUBLISHER)
VSCE_TOKEN_URL := https://dev.azure.com/$(VSCE_PUBLISHER)/_usersSettings/tokens
PYTHON := python3

help:
	@echo "\n Makefile Commands' Help\n"
	# Commands:
	#
	# move			:	Move the .vsix artifact(s) under .artifacts folder.
	# build			:	Build the extension (creates a.vsix file).
	# publish		:	Publish the extension.
	# release 		:	Build and Publish the extension.
	# vsceopen		:	Opens the VS Code Extension Management page for a Publisher.
	# vscetoken		:	Opens the Azure DevOps Page to Manage the Personal Access Token for VSCE.

move:
	@echo "\n Moving .vsix files to .artifacts folder... ⏳\n"
	mv *.vsix ./.artifacts/

build:
	@echo "\n🔥⚙️ Packaging... ⏳\n"
	vsce package

publish:
	@echo "\n📘📄 Publishing... ⏳\n"
	vsce publish

release: build publish
	@echo "\n✨ Releasing... ⏳\n"

vsceopen:
	@echo "\n✨ Open VS Code Extension Manager in Browser... ⏳\n"
	$(PYTHON) -c "import webbrowser; webbrowser.open('$(VSCE_MANAGEMENT_URL)')"

vscetoken:
	@echo "\n✨ Open VS Code Extension Token Manager in Browser... ⏳\n"
	$(PYTHON) -c "import webbrowser; webbrowser.open('$(VSCE_TOKEN_URL)')"
