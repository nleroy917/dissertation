DATE := $(shell date +%m-%d-%Y)
GITHASH := $(shell git rev-parse --short HEAD)

pdf:
	@[ -d out ] || mkdir -p out
	@[ -d out/pdfs ] || mkdir -p out/pdfs
	typst compile main.typ "out/pdfs/$(GITHASH)_$(DATE).pdf"

docx:
	@[ -d out ] || mkdir -p out
	@[ -d out/docx ] || mkdir -p out/docx
	pandoc \
	--from=typst \
	--to=docx \
	--output="out/docx/$(GITHASH)_$(DATE).docx" \
	--lua-filter=fix-typst-paths.lua \
	-V typst_root=$(shell pwd) \
	main.typ

typos:
	typos sections/*