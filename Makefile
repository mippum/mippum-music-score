# MuseScore CLI auto-detection
# Priority: mscore4 > mscore3 > mscore > musescore4 > musescore3 > musescore
# macOS app bundles are also checked.
MSCORE ?= $(shell \
  for cmd in mscore4 mscore3 mscore musescore4 musescore3 musescore; do \
    which $$cmd 2>/dev/null && break; \
  done; \
  for bundle in \
    "/Applications/MuseScore 4.app/Contents/MacOS/mscore" \
    "/Applications/MuseScore 3.app/Contents/MacOS/mscore"; do \
    test -x "$$bundle" && echo "$$bundle" && break; \
  done)

BUILD_DIR := build

SOURCES := $(shell find . -name '*.mscx' -not -path './$(BUILD_DIR)/*')
PDFS    := $(patsubst ./%.mscx,$(BUILD_DIR)/%.pdf,$(SOURCES))
VIDEOS  := $(patsubst ./%.mscx,$(BUILD_DIR)/%.mp4,$(SOURCES))

.PHONY: all pdf video clean check

all: pdf

pdf: check $(PDFS)
	@echo "Done. PDFs are in $(BUILD_DIR)/"

video: check $(VIDEOS)
	@echo "Done. Videos are in $(BUILD_DIR)/"

$(BUILD_DIR)/%.pdf: %.mscx
	@mkdir -p $(dir $@)
	$(MSCORE) -o $@ $<

$(BUILD_DIR)/%.mp4: %.mscx
	@mkdir -p $(dir $@)
	$(MSCORE) -o $@ $<

clean:
	rm -rf $(BUILD_DIR)

check:
	@if [ -z "$(MSCORE)" ]; then \
	  echo "Error: MuseScore CLI not found."; \
	  echo "  macOS : brew install --cask musescore"; \
	  echo "  Ubuntu: sudo apt install musescore3"; \
	  exit 1; \
	fi
	@echo "Using: $(MSCORE)"
