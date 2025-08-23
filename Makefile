DATE := $(shell date +%m-%d-%Y)

build:
	typst compile main.typ "out/$(DATE).pdf"

typos:
	typos sections/*