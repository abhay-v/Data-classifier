all:
	python src/main.py


format:
	@python -m black $(shell find ./src -type f -name "*.py")
