#!/bin/sh

set -e

icons_dir="$HOME/.local/share/icons"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$icons_dir"

for appimage in "$HOME"/applications/*.AppImage; do
  [ -f "$appimage" ] || continue

  name=$(basename "$appimage" .AppImage)
  icon="$icons_dir/$name.png"

  # Extract the AppImage's embedded icon into a scratch directory.
  workdir=$(mktemp -d)
  icon_path=""
  if (cd "$workdir" && "$appimage" --appimage-extract "*.png" >/dev/null 2>&1); then
    icon_rel=$(cd "$workdir" && find squashfs-root -maxdepth 1 -iname '*.png' -print -quit)
    [ -n "$icon_rel" ] && icon_path="$workdir/$icon_rel"
  fi

  # If the icon is a symlink, pull out its target so there is a real file to
  # copy instead of a dangling link. Extraction needs a fresh scratch dir.
  if [ -n "$icon_path" ] && [ -L "$icon_path" ]; then
    target=$(readlink "$icon_path")
    rm -rf "$workdir"
    workdir=$(mktemp -d)
    icon_path=""
    if (cd "$workdir" && "$appimage" --appimage-extract "$target" >/dev/null 2>&1); then
      icon_path="$workdir/squashfs-root/$target"
    fi
  fi

  if [ -n "$icon_path" ] && [ -f "$icon_path" ]; then
    cp "$icon_path" "$icon"
  fi
  rm -rf "$workdir"

  # Write the minimal desktop entry, adding the icon only if we got one.
  {
    echo "[Desktop Entry]"
    echo "Type=Application"
    echo "Name=$name"
    echo "Exec=$appimage"
    if [ -f "$icon" ]; then
      echo "Icon=$icon"
    fi
  } > "$HOME/.local/share/applications/$name.desktop"
done
