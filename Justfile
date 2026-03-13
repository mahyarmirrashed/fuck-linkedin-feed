dist := "dist"

# Build both Chrome and Firefox targets
build: build-chrome build-firefox

# Build Chrome extension (.zip)
build-chrome:
    mkdir -p {{dist}}
    zip -j {{dist}}/fuck-linkedin-feed.zip \
        manifest.json content.js \
        icon-16.png icon-48.png icon-128.png

# Build Firefox extension (.xpi)
build-firefox: build-chrome
    cp {{dist}}/fuck-linkedin-feed.zip {{dist}}/fuck-linkedin-feed.xpi

# Lint with web-ext
lint:
    web-ext lint --source-dir .

# Run in Firefox for testing
run:
    web-ext run --source-dir .

# Remove build artifacts
clean:
    rm -rf {{dist}}
