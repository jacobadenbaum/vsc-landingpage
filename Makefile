SCSS_SRC  = src/LandingPage/content/landingpage2.scss
SCSS_OUT  = src/LandingPage/content/dist/landingpage2.min.css

.PHONY: build package install clean

build:
	npx sass $(SCSS_SRC) $(SCSS_OUT) --style=compressed --no-source-map
	npx webpack --mode production --devtool hidden-source-map

package: build
	npx @vscode/vsce package

install: package
	code --install-extension $$(ls -t *.vsix | head -1)

clean:
	rm -rf dist *.vsix
