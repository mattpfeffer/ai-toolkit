# AI Toolkit

Various configurations and helpers for working with LLMs.

## Configurations

### ChatGPT

Customization JSON for ChatGPT. Loads a default profile and loader instructions for switchable style
profiles. Each profile is checksummed using a matching `.sha256` file with the SHA-256 of the JSON
bytes.`

- `configurations/chatgpt-traits.json`

## Profiles

Schema: `profile.v1`

- `profiles/design.json` (+ `.sha256`)
- `profiles/professional.json` (+ `.sha256`)
- `profiles/technical.json` (+ `.sha256`)
- `profiles/church.json` (+ `.sha256`)

## Versioning

- CalVer: `YYYY.MM.DD+N` (e.g., `2025.08.20+1`)
- Pin consumers to a commit; checksums enforce integrity.

## Verify locally

```bash
shasum -a 256 profiles/design.json
cat profiles/design.json.sha256
```
