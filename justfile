default:
    @just --list

# Copy image in the target
_copy_image:
    rm -rf dist
    mkdir -p dist
    cp -R assets dist/assets

# generate html slides
html: _copy_image
    npx @marp-team/marp-cli \
        --html \
        --output dist/index.html \
        slides.md

watch:
    npx @marp-team/marp-cli \
        --html \
        -w \
        --output dist/index.html \
        slides.md