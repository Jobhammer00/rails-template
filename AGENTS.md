# Rails Template

A new Rails app, generated from `Jobhammer00/rails-template` by Route14's "Project starten". It signs in, shows a dashboard and lets you change your password; the client's epics are built on top. Rails 8.1 on Ruby 4, PostgreSQL, Solid Queue/Cache/Cable, Hotwire + importmap + Propshaft, Tailwind v4 + Phlex + RubyUI, RSpec. Deployed with Kamal.

`CLAUDE.md` is a symlink to this file. Edit `AGENTS.md`.

@docs/harnas/CLAUDE.md

## First steps in a new app

Do these once, in the first PR, before the epics:

1. `bin/rename <name_in_snake_case> <port>`: gives the app its own name everywhere and a free dev port (taken: see `docs/harnas/rules/dev-environment.md`).
2. `bin/rails credentials:edit`: the template ships no credentials; this makes the app's own `config/credentials.yml.enc` and `config/master.key` (never committed).
3. The theme lives in `app/assets/tailwind/theme.css` (and fonts in `public/fonts/`); Route14 fills it from the project's design system with a PR (`design:export`). Do not move tokens elsewhere, and replace this paragraph and `README.md` with what the app is.

## Commands

| What | Command |
|---|---|
| Setup | `bin/setup` (`--skip-server` to not boot) |
| Dev server | `bin/dev` → http://localhost:3099 |
| Everything CI checks | `bin/ci` |
| One spec | `bundle exec rspec spec/requests/sessions_spec.rb` |

## Facts that shape most tasks

1. Auth is Rails' own (`Authentication` concern, `Current.user`); every controller requires a signed-in user unless it calls `allow_unauthenticated_access`.
2. Pages are Phlex views in `app/views/<controller>/<action>.rb` (`Views::Base`), rendered from the controller with `render Views::X.new(...)`. The layout is `app/views/layouts/application.html.erb`.
3. Components: RubyUI first (`bin/rails g ruby_ui:component <Name>`), then an app component in `app/components`.
4. Every user-facing string is a key in `config/locales/nl.yml` and `en.yml`; `nl` is the default. `spec/i18n_parity_spec.rb` fails on a missing key.

## Local app

- Dev user from `db/seeds.rb`: `dev@example.test`, password `password`.

## Watch out

- Merging a PR with a `release:` label, or `bin/deploy`, deploys.
- `prism` is pinned below 2 in the `Gemfile` until `refract` (through Phlex) supports Prism 2.

## Workflow

- Branch off `main` (`feat/…`, `fix/…`, `chore/…`, `docs/…`). Never commit or push to `main`.
- Conventional Commits in English for commits and PR titles.
- Specs come with every behaviour change. Run `bin/ci` until green — actually run, not assumed.
- Open a PR to `main`. Never merge, never add a `release:` label, never deploy.
- Never touch `.env` files or credentials, never reset the database.

## Read more

- `docs/harnas/`: the harness (a copy of `harnas-rails`; update it there first).
- `docs/features/`: one doc per feature. `docs/besluiten.md`: decisions.
