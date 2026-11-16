# Stack

- **Rails 8.1 on Ruby 4**, `rails new -d postgresql`. SQLite only for a small
  internal tool that has no queries worth a server (lookout).
- **Hotwire**: Turbo (frames, streams, morph refreshes) and Stimulus, with
  **importmap** and **Propshaft**. No JavaScript bundler, no SPA framework. A
  vendored bundle that must be built (TipTap in notesk) is committed.
- **Solid Queue, Solid Cache, Solid Cable**, each with its own database in
  production. Jobs run inside Puma until there is more than one server.
- **Tailwind v4** (`tailwindcss-rails`) with design tokens.
- **Phlex + RubyUI** for components (`tailwind_merge`, `ruby_ui`). A small app
  may stay with ERB (habittrack, uitgaven).
- **RSpec** with fixtures. See `testing.md`.
- **Kamal + Thruster**, deployed through the shared workflows. See `deploy.md`.
- **Active Storage** for files; `libvips` for variants.
- **Hotwire Native Android** shell in `android/` where an app needs one. See
  `native-android.md`.
- Tools: `rubocop-rails-omakase`, `erb_lint`, `brakeman`, `bundler-audit`,
  `strong_migrations`, `bullet` (dev/test).
- Anything beyond this needs a reason in the PR. Before adding a gem: is it
  already in the codebase, is it in Rails, is it in an installed gem?
