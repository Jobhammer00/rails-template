# Code style

- **RuboCop with `rubocop-rails-omakase`, no custom overrides.** Exclusions are only
  for generated or vendored files and are named in the PR.
- **`erb_lint`** on `app/views` with `.erb_lint.yml` from `stubs/`
  (`RequireScriptNonce`, `ErbSafety` on).
- A new lint exception or a lowered check is a deliberate choice stated in the PR,
  never a quiet change.
- Commit messages and PR titles are Conventional Commits in English
  (`fix(list): keep unknown amounts unknown`). Code and identifiers are English; UI
  text is in the locale files.
- `# frozen_string_literal: true` in every file that already uses it (portfolio
  puts it in every model and service).
- No single-letter variables, parameters or block arguments (`u`, `|x|`); a name
  says what it holds. Only a trivial numeric loop counter is exempt.
