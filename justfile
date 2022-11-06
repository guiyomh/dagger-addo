# list all recipes
default:
    @just --list

html:="html"

# Copy image in the target
_copy_image:
    rm -rf dist
    mkdir -p dist
    cp -R assets dist/assets

# watch change and refresh slides
watch:
    npx @marp-team/marp-cli \
        --html \
        -w \
        --output dist/index.html \
        slides.md

# lint all the project
lint:
    dagger-cue do -p dagger.cue lint

# build slides in pdf, html, pdf
build type=html:
    dagger-cue do -p dagger.cue build {{type}}

