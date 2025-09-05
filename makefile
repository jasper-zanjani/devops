.PHONY: build publish quick
include .env
build: 		mkdocs.yml docs/
	$(MKDOCS_BIN) build --site-dir $(MKDOCS_TARGET_DIR) --quiet
publish: 	mkdocs.yml docs/
	$(MKDOCS_BIN) build -q 2>/dev/null
	$(MKDOCS_BIN) gh-deploy 
