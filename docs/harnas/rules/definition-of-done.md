# Definition of done

Done means all of this, really run and not assumed:

- Specs for the change, green, including the failure path.
- Everything CI checks is green: RuboCop, `erb_lint`, Brakeman, `bundler-audit`,
  importmap audit, RSpec (`bin/ci`, or `bin/lint` where the app has it).
- Both locales have every new string (`nl` and `en`).
- The affected feature doc, skill and `AGENTS.md` are updated.
- The change was clicked through in the browser, happy path and failure path. For a
  native change: installed on the emulator and checked with adb/logcat.
- Committed on a feature branch, pushed, and a PR opened to `main`. Not merged, not
  labelled, not deployed.
- The report says what changed, which checks ran, the PR link, and the developer's
  final check: exactly which page and which step.
