.PHONY: test docs

# Global variables
PYTHON_INTERPRETER = python3

# Check that docs can build
test:
	cd docs && mkdocs serve

# Check that docs can build
docs:
	mkdocs build --config-file docs/mkdocs.yml
	cp -rf docs/site/* .
	rm -rf docs/site
	git add --all
	git commit -m "Updates to Website"
	git push origin master
	@echo "Website updated! Check it out: https://gmihaila.github.io "

