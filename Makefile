DATE := $(shell date +%m-%d-%Y)
GITHASH := $(shell git rev-parse --short HEAD)

build:
	@[ -d out ] || mkdir -p out
	typst compile main.typ "out/$(GITHASH)_$(DATE).pdf"

typos:
	typos sections/*