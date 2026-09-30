#!/usr/bin/env bash
# proof of concept: fill every template with palette.conf and write to out/
# {{name}} becomes the hex without #, so templates add the # themselves where needed
#
# not wired up to anything yet, real configs are untouched

cd "$(dirname "$0")"
mkdir -p out

# turn palette.conf into sed commands: s/{{bg}}/0f130d/g
script=$(grep -v '^\s*#' palette.conf | grep '=' | while IFS='=' read -r name hex; do
    printf 's/{{%s}}/%s/g\n' "$(echo $name)" "$(echo $hex)"
done)

for tpl in templates/*; do
    sed "$script" "$tpl" > "out/$(basename "$tpl")"
    echo "rendered out/$(basename "$tpl")"
done

# anything still in {{ }} is a typo or a missing colour
grep -Hn '{{' out/* && echo "^ unfilled placeholders" || true
