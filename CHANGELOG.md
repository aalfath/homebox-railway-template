# Changelog

Deployers: read this before you apply an update. Back up the `/data` volume first.

## Unreleased (2026-11-16)

- README: added the Deploy on Railway button. No change to the app or the image.

## 0.27.1 (2026-11-16)

**Breaking or notable changes first**

- HomeBox 0.27 blocks notifiers (webhooks) to internal and private IP addresses by default. If a notifier must reach a private address, see the [notifier security settings](https://homebox.software/en/user-guide/notifiers/#network-security-for-notifiers) (`HBOX_NOTIFIER_ALLOW_NETS`).
- The template now builds from this repository instead of running the image directly, so later merges to `main` reach deployers as Railway update notices.

**Changes**

- HomeBox 0.26.2 → 0.27.1 (`ghcr.io/sysadminsmedia/homebox:0.27.1@sha256:9d0b64776c694f018c0ca06faf52105a33ca376024f46bb58e6ab0e2b728bb61`). 0.27.0 fixes 15 security advisories; 0.27.1 patches Node.js.
- Logs are JSON on stdout, so Railway shows the real log level instead of marking every line as an error.
- `HBOX_OPTIONS_TRUST_PROXY=true`, because Railway terminates HTTPS in front of the app.
- HomeBox listens on Railway's `PORT` (7745 by default).
- Fixed settings (log format, upload limit, analytics off, UTC) moved into the image as defaults; set a service variable to override any of them.
