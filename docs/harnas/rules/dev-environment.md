# Development environment

- **Every app runs locally in Docker behind the shared Traefik** in
  `~/Projects/docker-devtools`, at `https://<app>.test` with a trusted certificate.
  Start it once per machine with `make setup` and `make up` there. It also runs
  Mailpit (SMTP `mailpit:1025`, inbox `https://mailpit.test`).
- The app's `docker-compose.yml` (see `stubs/docker-compose.yml`): service `web` from
  `ruby:4.0.1-slim` with an inline Dockerfile, the repo mounted at `/rails`, gems in
  a named `bundle` volume (Linux builds), the external network `web`, a healthcheck
  on `/up`, and Traefik labels (`Host(`<app>.test`)`, entrypoint `websecure`, TLS).
  Add `libvips` to the image when the app has Active Storage variants.
- **PostgreSQL is the one on the Mac**, reached through `host.docker.internal`
  (`PGHOST`, `PGUSER`, or `DB_HOST` as the app's `database.yml` expects). No database
  container. `db:prepare` runs on start where the app wants it; after a migration
  restart the container (`docker compose restart web`).
- A Tailwind app has a second service `css` running `bin/rails tailwindcss:watch[always]`
  with its own empty `log/` and `tmp/` volumes, so the watcher does not rebuild for the
  web container's log writes.
- Mail goes to Mailpit: `SMTP_HOST: mailpit`.
- **Every app has its own port**, set in `bin/dev` (`-p <port>`) and published as
  `127.0.0.1:<port>:3000`. The Android emulator reaches it at `http://10.0.2.2:<port>`.
  Taken so far: habittrack 3000, notesk 3002, gvexcelsior 3003, uitgaven 3004.
- Without Docker: `bin/dev`, and `devsite <port>` from `~/Projects/dotfiles` for
  `https://<app>.test` (Herd and the Traefik share 127.0.0.1:80/443; only one runs at
  a time). `*.test` resolves through dnsmasq.
- `bin/setup` and `bin/setup-dev` prepare a checkout (`--skip-server` to not boot).
  A fresh checkout may need a built asset (`bin/rails tailwindcss:build`) before the
  specs run.
- Local requirements: PostgreSQL running, `brew install vips`.
- Never put `.env` handling in the compose file's setup. The Docker environment never
  writes or reads `.env`.
