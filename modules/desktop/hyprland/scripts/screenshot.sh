for cmd in grimblast notify-send; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "$cmd not found"; exit 1; }
done

# Kill existing swappy (if running)
pkill -x swappy 2>/dev/null || true

print_error() {
    cat << EOF
Usage: $(basename "$0") <action>
Valid actions:
  s  : Snip current screen
  sf : Snip current screen (frozen)
EOF
    exit 1
}

case "$1" in
    s)  grimblast copy area ;;
    sf) grimblast --freeze copy output ;;
    *)  print_error ;;
esac

notify-send -a Screenshot -r 91190 -t 2200 -i Saved"
