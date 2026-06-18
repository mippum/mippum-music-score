# windows 에서는 bash.exe(Git Bash) 로 실행해야함
#
# DIR 특정하는 법
# make musicxml DIR=piano/ferdinand_beyer
# make video DIR=piano/...         → 시트에 맞춰 내보내기
# make video DIR=piano/... RES=1080p → 해상도로 맞춰서 내보내기 (2160p/1440p/1080p/720p/480p/360p)
#
# MuseScore CLI auto-detection
# Priority: mscore4 > mscore3 > mscore > musescore4 > musescore3 > musescore
# macOS app bundles and Windows default install paths are also checked.
MSCORE ?= $(shell \
  for cmd in mscore4 mscore3 mscore musescore4 musescore3 musescore; do \
    which $$cmd 2>/dev/null && break; \
  done; \
  for bundle in \
    "/Applications/MuseScore 4.app/Contents/MacOS/mscore" \
    "/Applications/MuseScore 3.app/Contents/MacOS/mscore" \
    "/c/Program Files/MuseScore 4/bin/MuseScore4.exe" \
    "/c/Program Files/MuseScore 3/bin/MuseScore3.exe"; do \
    test -x "$$bundle" && echo "$$bundle" && break; \
  done)

BUILD_DIR := build
DIR       ?= .

.PHONY: all pdf musicxml video clean check

all: pdf

pdf: check
	@find $(DIR) -name $(BUILD_DIR) -prune -o -name '*.mscx' -print | while IFS= read -r f; do \
	  out="$(BUILD_DIR)/$${f%.mscx}.pdf"; \
	  mkdir -p "$$(dirname "$$out")"; \
	  "$(MSCORE)" -o "$$out" "$$f"; \
	done
	@echo "Done. PDFs are in $(BUILD_DIR)/"


musicxml: check
	@find $(DIR) -name $(BUILD_DIR) -prune -o -name '*.mscx' -print | while IFS= read -r f; do \
	  out="$(BUILD_DIR)/$${f%.mscx}.musicxml"; \
	  mkdir -p "$$(dirname "$$out")"; \
	  "$(MSCORE)" -o "$$out" "$$f"; \
	done
	@echo "Done. MusicXML files are in $(BUILD_DIR)/"

video: check
	@find $(DIR) -name $(BUILD_DIR) -prune -o -name '*.mscx' -print | while IFS= read -r f; do \
	  out="$(BUILD_DIR)/$${f%.mscx}.mp4"; \
	  mkdir -p "$$(dirname "$$out")"; \
	  "$(MSCORE)" --score-video $(if $(RES),--resolution $(RES),) -o "$$out" "$$f"; \
	done
	@echo "Done. MP4 files are in $(BUILD_DIR)/"

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
