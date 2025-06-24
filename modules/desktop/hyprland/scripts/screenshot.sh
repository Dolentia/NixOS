#!/usr/bin/env bash
set -euo pipefail

pkill -x swappy 2>/dev/null || true

for cmd in grimblast swappy wl-copy notify-send; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "$cmd not found"; exit 1; }
done

usage() {
    printf "Usage: %s {p|s|sf|m}\n" "$(basename "$0")"
    printf "  p  : copy all screens\n"
    printf "  s  : snip area\n"
    printf "  sf : snip area (freeze)\n"
    printf "  m  : copy focused monitor\n"
    exit 1
}

case "${1-}" in
    p) grim=(grimblast save screen -)  ;;
    s) grim=(grimblast save area  -)   ;;
    sf) grim=(grimblast --freeze save area -) ;;
    m) grim=(grimblast save output -)  ;;
    *) usage ;;
esac

(
    "${grim[@]}" \
    | swappy -f - -o - \
    | wl-copy --type image/png
) & disown

notify-send -a Screenshot -r 91190 -t 2200 "Screenshot copied to clipboard"
