DATE := $(shell date +%m-%d-%Y)
GITHASH := $(shell git rev-parse --short HEAD)

pdf:
	@[ -d out ] || mkdir -p out
	@[ -d out/pdfs ] || mkdir -p out/pdfs
	typst compile main.typ "out/pdfs/$(GITHASH)_$(DATE)_MAIN.pdf"

docx:
	@[ -d out ] || mkdir -p out
	@[ -d out/docx ] || mkdir -p out/docx
	pandoc \
		--from=typst \
		--to=docx \
		--output="out/docx/$(GITHASH)_$(DATE)_MAIN.docx" \
		--lua-filter=filters/fix-typst-paths.lua \
		-V typst_root=$(shell pwd) \
	main.typ

md:
	@[ -d out ] || mkdir -p out
	@[ -d out/md ] || mkdir -p out/md
	pandoc \
		--from=typst \
		--to=markdown \
		--output="out/md/$(GITHASH)_$(DATE)_MAIN.md" \
		--lua-filter=filters/fix-typst-paths.lua \
		-V typst_root=$(shell pwd) \
	main.typ

txt:
	@[ -d out ] || mkdir -p out
	@[ -d out/txt ] || mkdir -p out/txt
	pandoc \
		--from=typst \
		--to=plain \
		--output="out/txt/$(GITHASH)_$(DATE)_MAIN.txt" \
		--lua-filter=filters/fix-typst-paths.lua \
		-V typst_root=$(shell pwd) \
	main.typ

odt:
	@[ -d out ] || mkdir -p out
	@[ -d out/odt ] || mkdir -p out/odt
	pandoc \
		--from=typst \
		--to=odt \
		--output="out/odt/$(GITHASH)_$(DATE)_MAIN.odt" \
		--lua-filter=filters/fix-typst-paths.lua \
		-V typst_root=$(shell pwd) \
	main.typ

ch1:
	typst \
		compile sections/chapter1/main.typ \
		--root=./ \
		--input partial=true \
		"out/pdfs/$(GITHASH)_$(DATE)_CH1.pdf"

ch2:
	typst \
		compile sections/chapter2/main.typ \
		--root=./ \
		--input partial=true \
		"out/pdfs/$(GITHASH)_$(DATE)_CH2.pdf"

ch3:
	typst \
		compile sections/chapter3/main.typ \
		--root=./ \
		--input partial=true \
		"out/pdfs/$(GITHASH)_$(DATE)_CH3.pdf"

release:
	typst \
		compile main.typ
		--input release=true \
		"out/pdfs/$(GITHASH)_$(DATE)_RELEASE.pdf"

typos:
	typos sections/*