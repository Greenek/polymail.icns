INKSCAPE=$(shell which inkscape)

define print_header
@echo
@echo "==> $(1)"
@echo
endef

define svg_to_png
@$(INKSCAPE) -z -e $(CURDIR)/$1/$(2).png -w $(3) -h $(3) $(CURDIR)/$(4) 1>/dev/null
@echo "convert $(4) to $(2).png"

endef

define convert
$(call svg_to_png,$(1),icon_$(2)x$(2),$(2),$(3))
$(call svg_to_png,$(1),icon_$(2)x$(2)@2x,$(shell echo $$(($2*2))),$(3))

endef

all: build install clean

Polymail.icns: Polymail.iconset
	$(call print_header,"Create icon resource")
	rm -f Polymail.icns
	iconutil -c icns -o $@ $^

Polymail.iconset:
	$(call print_header,"Convert svg to pngs")
	mkdir -p $@
	$(foreach size,16 32,$(call convert,$@,$(size),Icon64.svg))
	$(foreach size,128 256 512,$(call convert,$@,$(size),Icon1024.svg))

build: clean Polymail.icns

clean:
	rm -rf Polymail.iconset

install:
	$(call print_header,"Install icns")
	./install.sh Polymail.icns

.PHONY: all build clean install
