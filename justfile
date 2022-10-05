default:
    @just --list

# Copy image in the target
_copy_image:
    mkdir -p dist
    cp -R assets dist/assets

# generate html slides
html: _copy_image
    npx @marp-team/marp-cli \
        --html \
        --output dist/index.html \
        slides.md