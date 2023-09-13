
CRAWL_OUTPUT_PATH="./routes"

.PHONY: crawl
crawl:
	bash scripts/crawler.sh ${CRAWL_OUTPUT_PATH}

.PHONY: build-slide
build-slide:
	bash scripts/slide-builder.sh ${DIR}

.PHONY: build-all
build-all: crawl
	bash scripts/build-all.sh $(shell cat $(CRAWL_OUTPUT_PATH)/routes.txt)

.PHONY: ready
ready: build-all