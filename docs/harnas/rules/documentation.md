# Documentation

- **`AGENTS.md` is the source, `CLAUDE.md` a symlink to it.** It holds, in this
  order: what the app is (one paragraph), commands (setup, dev server, tests,
  everything CI checks), facts that shape most tasks, house style, UI, comments,
  testing, local app (URL, dev user), workflow, and where to read more. Start from
  `stubs/AGENTS.md`.
- **Every app has `docs/features/`**: one doc per feature (what it does, where it lives,
  the rules), shaped by `stubs/features-template.md` (copied to `docs/features/_template.md`), with an index in `docs/features/README.md`.
  A new feature starts with its doc. Decisions live in `docs/besluiten.md`;
  open points in `docs/openstaand.md` when the app needs one.
- A change that makes `AGENTS.md`, a skill or a feature doc untrue updates it in the
  same PR, including the doc of any feature it changes.
- A surface with its own rules (desktop, mobile, Android, Electron) may have a skill
  in `.claude/skills/` that loads on demand. Do not duplicate it in `AGENTS.md`.
- Never put secrets, tokens or personal data in docs.
- Local checkouts lag: `git fetch` and look at `origin/main` before trusting a doc.
