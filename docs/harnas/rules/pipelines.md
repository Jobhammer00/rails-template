# Pipelines and git

- CI runs only through the shared workflows in `Jobhammer00/deploy` (`ci.yml`,
  `release.yml`, `kamal.yml`, `android.yml`), never through custom jobs in the app.
  The app's workflow files are a few lines that call them (see `stubs/`).
- **`bin/ci` is the one command for "everything CI checks"** (Rails-native, steps in
  `config/ci.rb`, see `stubs/ci.rb`). An app that still has `bin/lint` + `bin/test`
  gets a `bin/ci` that runs the same steps.
- `ci.yml` runs on pull requests (not drafts) as one job named
  `ci / Lint, security and tests`: RuboCop, `erb_lint`, Brakeman, `bundler-audit`,
  importmap audit and the tests. Branch protection on `main` requires it.
  Per-app inputs: `postgres`, `apt-packages`, `before-test`, `test`.
- **Branches** come off `main`: `feat/…`, `fix/…`, `chore/…`, `docs/…`. Never
  commit or push to `main`. A PR goes to `main`.
- **Commits and PR titles** are Conventional Commits in English. One subject per PR.
- A **release** is a merge into `main` with the label
  `release: epoch|major|minor|patch`, or Actions → Release → Run workflow, or
  `bin/deploy`. It tags `v<EPOCH.MAJOR.MINOR.PATCH>`, creates a GitHub Release and
  deploys that tag. The tag is the only version; nothing is committed back, so
  `config/version.rb` is never edited by hand.
- Never merge, never add a `release:` label, never deploy without the developer.
- The PR description matches the code and is updated after every change.
- When a review comment is answered: the commit hash, what was done, and which
  spec was added. Pushing back is allowed, with evidence.
