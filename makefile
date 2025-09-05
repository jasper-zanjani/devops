.PHONY: build publish quick
include .env
build: 		mkdocs.yml docs/
	$(MKDOCS_BIN) build --site-dir $(MKDOCS_TARGET_DIR) --quiet
	sudo cp -r $(MKDOCS_TARGET_DIR) /usr/share/nginx/web
publish: 	mkdocs.yml docs/
	$(MKDOCS_BIN) build -q 2>/dev/null
	$(MKDOCS_BIN) gh-deploy 
