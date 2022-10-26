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
        --theme-set addo.css \
        -- \
        slides.md

watch:
    npx @marp-team/marp-cli \
        --html \
        -w \
        --output dist/index.html \
        slides.md

lint:
    dagger do -p dagger.cue lint


build type: _copy_image
      npx @marp-team/marp-cli \
        --{{type}} \
        --output dist/index.{{type}} \
        --theme-set addo.css \
        -- \
        slides.md

dagger target:
    dagger do -p dagger.cue {{target}}
