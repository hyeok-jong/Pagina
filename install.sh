#!/bin/bash
# Pagina installer
#   curl -fsSL https://raw.githubusercontent.com/hyeok-jong/Pagina/main/install.sh | bash
set -euo pipefail

REPO="hyeok-jong/Pagina"
APP_NAME="Pagina.app"

bold() { printf "\033[1m%s\033[0m\n" "$1"; }
fail() { printf "\033[31mError:\033[0m %s\n" "$1" >&2; exit 1; }

[[ "$(uname)" == "Darwin" ]] || fail "Pagina only runs on macOS."
MAJOR=$(sw_vers -productVersion | cut -d. -f1)
(( MAJOR >= 15 )) || fail "Pagina requires macOS 15 or later (you have $(sw_vers -productVersion))."

# PAGINA_URL / PAGINA_DEST_DIR 로 다운로드 주소와 설치 위치를 바꿀 수 있음
URL="${PAGINA_URL:-}"
if [[ -z "$URL" ]]; then
bold "==> Finding the latest Pagina release"
# 베타 릴리스(prerelease)도 포함해서 가장 최신 것을 고름
URL=$(curl -fsSL "https://api.github.com/repos/$REPO/releases" \
    | grep -o '"browser_download_url": *"[^"]*\.zip"' \
    | head -n 1 | sed -E 's/.*"(https[^"]+)"/\1/')
[[ -n "$URL" ]] || fail "No release found at https://github.com/$REPO/releases"
fi
echo "    $URL"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

bold "==> Downloading"
curl -fsSL "$URL" -o "$TMP/Pagina.zip"

# 체크섬 파일이 있으면 검증
if curl -fsSL "$URL.sha256" -o "$TMP/Pagina.zip.sha256" 2>/dev/null; then
    EXPECTED=$(awk '{print $1}' "$TMP/Pagina.zip.sha256")
    ACTUAL=$(shasum -a 256 "$TMP/Pagina.zip" | awk '{print $1}')
    [[ "$EXPECTED" == "$ACTUAL" ]] || fail "Checksum mismatch."
    echo "    checksum OK"
fi

ditto -x -k "$TMP/Pagina.zip" "$TMP"
[[ -d "$TMP/$APP_NAME" ]] || fail "The archive does not contain $APP_NAME."

# /Applications에 쓸 수 있으면 거기, 아니면 ~/Applications
if [[ -n "${PAGINA_DEST_DIR:-}" ]]; then DEST_DIR="$PAGINA_DEST_DIR"
elif [[ -w /Applications ]]; then DEST_DIR=/Applications; else DEST_DIR="$HOME/Applications"; fi
mkdir -p "$DEST_DIR"
DEST="$DEST_DIR/$APP_NAME"

bold "==> Installing to $DEST"
pkill -x Pagina 2>/dev/null || true
rm -rf "$DEST"
ditto "$TMP/$APP_NAME" "$DEST"
xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true

[[ -n "${PAGINA_NO_OPEN:-}" ]] || open "$DEST"
bold "==> Done! Pagina is in your Applications folder."
