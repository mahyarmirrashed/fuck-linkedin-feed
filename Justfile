set dotenv-load

# Build all the browser extensions
build: build-chrome build-firefox

# Build the Chrome extension (.zip)
build-chrome:
    mkdir -p dist
    zip -j dist/fuck-linkedin-feed.zip \
        manifest.json content.js \
        icon-16.png icon-48.png icon-128.png

# Build the Firefox extension (.xpi)
build-firefox: build-chrome
    cp dist/fuck-linkedin-feed.zip dist/fuck-linkedin-feed.xpi

# Validate the extension manifest and source
lint:
    web-ext lint --source-dir .

# Launch a browser instance with the extension loaded
run:
    web-ext run --source-dir .

# Sign the extension for distribution
sign:
    web-ext sign \
        --source-dir . \
        --channel unlisted \
        --api-key $AMO_API_KEY \
        --api-secret $AMO_API_SECRET \
        --artifacts-dir dist

# Remove the build artifacts
clean:
    rm -rf dist
