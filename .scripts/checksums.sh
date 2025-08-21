#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
PROFILES_DIR="$ROOT/profiles"

if [[ ! -d "$PROFILES_DIR" ]]; then
  echo "Profiles directory not found at: $PROFILES_DIR" >&2
  exit 1
fi

# Pick a SHA-256 tool
if command -v sha256sum >/dev/null 2>&1; then
  HASH_CMD=(sha256sum)
elif command -v shasum >/dev/null 2>&1; then
  HASH_CMD=(shasum -a 256)
else
  echo "No sha256 tool found (need sha256sum or shasum)." >&2
  exit 1
fi

changed=0
while IFS= read -r -d '' json; do
  sidecar="${json}.sha256"

  # Compute hash as lowercase hex only
  hash="$("${HASH_CMD[@]}" "$json" | awk '{print tolower($1)}')"

  # Only write if changed (keeps timestamps stable)
  if [[ -f "$sidecar" ]]; then
    existing="$(tr '[:upper:]' '[:lower:]' < "$sidecar" | tr -d '\r\n')"
  else
    existing=""
  fi

  if [[ "$hash" != "$existing" ]]; then
    printf "%s" "$hash" > "$sidecar"
    echo "Updated: $(basename "$sidecar")"
    changed=$((changed+1))
  fi
done < <(find "$PROFILES_DIR" -maxdepth 1 -type f -name "*.json" -print0)

if [[ $changed -eq 0 ]]; then
  echo "No changes. All checksums up to date."
else
  echo "Done. $changed checksum(s) updated."
fi
