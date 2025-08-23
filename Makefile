DATE := $(shell date +%m-%d-%Y)

build:
	@[ -d out ] || mkdir -p out
	typst compile main.typ "out/$(DATE).pdf"

typos:
	typos sections/*