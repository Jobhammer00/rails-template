# Project start

Setting up a new app. The template is **notesk** (Phlex + RubyUI + RSpec, with an
Android shell): copy from it instead of generating, then strip what the app does not
need.

1. Start from notesk (or `rails new <app> -d postgresql` with the versions in
   `stack.md`).
2. Copy from `stubs/`: `.rubocop.yml`, `.erb_lint.yml`, `config/ci.rb`,
   `docker-compose.yml`, `config/deploy.yml`, `.kamal/secrets`, `.github/workflows/{ci,release,kamal}.yml`
   and `AGENTS.md`. Replace every `<app>` / `<App>`.
3. `config/database.yml`: the `production:` block with primary, cache, queue and
   cable databases. `DB_HOST` is `<app>-postgres`.
4. `config/version.rb`: `<App>::VERSION` from `KAMAL_VERSION`, else the latest
   `v*` tag. Nothing is committed back.
5. Give the app its own port (`dev-environment.md`), `docker compose up -d` for
   `https://<app>.test`.
6. `CLAUDE.md` is a symlink to `AGENTS.md`. `AGENTS.md` follows `documentation.md`.
7. 1Password item `Deploy/<app>-production` with `HOST_IP_NAME`,
   `KAMAL_REGISTRY_PASSWORD`, `RAILS_MASTER_KEY`, `POSTGRES_PASSWORD` and whatever
   else `.kamal/secrets` fetches. Only filled fields: an empty one stops Kamal.
8. GitHub: repository secret `OP_SERVICE_ACCOUNT_TOKEN`, and branch protection on
   `main` requiring `ci / Lint, security and tests`.
9. Decide per app, once, and record it in `docs/besluiten.md`: the languages
   (`nl` + `en`), whether there is a PWA, whether there is an Android shell, and
   which fields are encrypted.
10. The first deploy (`bin/deploy setup`) is done by the developer.
