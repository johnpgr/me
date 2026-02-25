OUTDIR ?= dist

.PHONY: build serve clean size size-br size-gz size-all

build:
	zola build -o $(OUTDIR) --force

serve:
	zola serve -o $(OUTDIR) --force --store-html

clean:
	rm -rf $(OUTDIR)

size:
	wc -c "$(OUTDIR)/index.html"

size-br:
	brotli -q 11 -c "$(OUTDIR)/index.html" | wc -c

size-gz:
	gzip -9 -c "$(OUTDIR)/index.html" | wc -c

size-all: build size size-br size-gz
