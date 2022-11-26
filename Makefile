# source:
#  - https://code.visualstudio.com/api/working-with-extensions/publishing-extension
#  - https://github.com/microsoft/vscode-vsce/issues/11
#  - https://dev.azure.com/sugatoray/_usersSettings/tokens

.PHONY: build publish

move:
	@echo "\n Moving .vsix files to .artifacts folder"
	mv *.vsix ./.arifacts/

build:
	@echo "\n🔥⚙️ Packaging... ⏳\n"
	vsce package

publish:
	@echo "\n📘📄 Publishing... ⏳\n"
	vsce publish

release: build publish
	@echo "\n✨ Releasing... ⏳\n"
