# Deploy

- **Kamal** to one arm64 host behind kamal-proxy with a Postgres accessory
  (`<app>-postgres`), behind Cloudflare. The host comes from `HOST_IP_NAME`, never
  from the repo.
- The image is built **natively on an arm64 runner** (or an Apple silicon Mac),
  never on the server, and pushed to `ghcr.io/jobhammer00/<app>` (lowercase). Layers
  are cached in `ghcr.io/jobhammer00/<app>-build-cache`.
- `proxy.forward_headers: true` while the domain is proxied by Cloudflare, or every
  request and every rate limit looks like Cloudflare's edge.
- **Secrets** come from 1Password: vault `Deploy`, item `<app>-production`, fetched
  in one go with Kamal's 1Password adapter in `.kamal/secrets`. Locally `op` asks
  the 1Password app; in Actions it uses the service account
  (`OP_SERVICE_ACCOUNT_TOKEN`). Only filled fields: an empty one stops Kamal. No
  `bin/kamal-secret`: Kamal ignores a failing `$(...)`, the adapter does not.
- Persistent storage is a named volume (`<app>_storage:/rails/storage`). Keep the
  previous version's fingerprinted assets around with `asset_path`.
- `KAMAL_VERSION` is the tag. `<App>::VERSION` reads it (`project-start.md`).
- Releases go through `release.yml`; any other Kamal command (logs, rollback, app
  details) goes through `kamal.yml`. Aliases in `deploy.yml`: `console`, `shell`,
  `logs`, `dbc`.
- The first setup of a server (`bin/deploy setup`) and every production change is
  the developer's. Never deploy, never run Kamal against production, never change
  `.kamal/secrets` values.
- Renaming an app touches `config/deploy.yml`, `.kamal/secrets`,
  `.github/workflows/{release,kamal}.yml` and `.env.example`.
