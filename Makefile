BIN:=node_modules/.bin

test:
	$(BIN)/eslint --color --quiet *.js

publish:
	git push -u --tags origin master
	npm publish

update:
	./updates.js -u
	rm -rf node_modules
	yarn

npm-patch:
	npm version patch

npm-minor:
	npm version minor

npm-major:
	npm version major

patch: lint test npm-patch publish
minor: lint test npm-minor publish
major: lint test npm-major publish

.PHONY: test publish patch minor major npm-patch npm-minor npm-major
