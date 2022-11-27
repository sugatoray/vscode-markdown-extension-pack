# source:
#  - https://code.visualstudio.com/api/working-with-extensions/publishing-extension
#  - https://github.com/microsoft/vscode-vsce/issues/11
#  - https://dev.azure.com/sugatoray/_usersSettings/tokens

.PHONY: help move build publish release

help:
	@echo "\n Makefile Commands' Help\n"
	# Commands:
	#
	# move:			Move the .vsix artifact(s) under .artifacts folder.
	# build:		Build the extension (creates a.vsix file).
	# publish:		Publish the extension.
	# release: 		Build and Publish the extension.

move:
	@echo "\n Moving .vsix files to .artifacts folder... ⏳\n"
	mv *.vsix ./.arifacts/

build:
	@echo "\n🔥⚙️ Packaging... ⏳\n"
	vsce package

publish:
	@echo "\n📘📄 Publishing... ⏳\n"
	vsce publish

release: build publish
	@echo "\n✨ Releasing... ⏳\n"
