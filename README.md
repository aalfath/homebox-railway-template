# HomeBox on Railway

One-click [HomeBox](https://homebox.software) for [Railway](https://railway.com): a self-hosted home inventory for your belongings, their locations, warranties, receipts and maintenance.

## What it deploys

- **HomeBox 0.27.1**, the official image `ghcr.io/sysadminsmedia/homebox:0.27.1`, pinned by digest in the [`Dockerfile`](Dockerfile).
- One service with a public HTTPS domain, health check `/api/v1/status`.
- One volume at `/data` for the SQLite database and uploaded files.

No database service is needed: HomeBox uses an embedded SQLite database on the volume.

## Variables

| Variable | Default | What it does |
|---|---|---|
| `PORT` | `7745` | Port HomeBox listens on; Railway's domain and health check use it |
| `HBOX_AUTH_API_KEY_PEPPER` | generated 64-character secret | Required by HomeBox; secures API key hashes. Changing it invalidates existing API keys |
| `HBOX_OPTIONS_ALLOW_REGISTRATION` | `true` | Lets the first user sign up. Set it to `false` after you've created your accounts |

Other settings are baked in as defaults (`HBOX_LOG_FORMAT=json`, `HBOX_OPTIONS_TRUST_PROXY=true`, `HBOX_WEB_MAX_UPLOAD_SIZE=10`, `HBOX_OPTIONS_ALLOW_ANALYTICS=false`, `TZ=Etc/UTC`). Override any of them, or add any other [HomeBox setting](https://homebox.software/en/quick-start/configure/) (SMTP, OIDC, Meilisearch search), as a service variable.

## After deploying

1. Open the public URL and register: the first account is yours.
2. Set `HBOX_OPTIONS_ALLOW_REGISTRATION=false` once everyone who needs an account has one, unless you want public sign-ups.

## Updates

This template builds from this repository. When a new HomeBox version is merged to `main`, Railway shows an "update available" notice on your project and you choose when to apply it. Read [`CHANGELOG.md`](CHANGELOG.md) and back up the `/data` volume before updating.
