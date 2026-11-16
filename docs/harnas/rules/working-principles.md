# Working principles

- Do not build without a reason. Know what the feature is for and how it is
  used. If that is missing, ask first.
- A big feature is split up first, and each step is agreed. Nothing is filled in
  by assumption.
- Read what exists before building: the feature doc in `docs/features/`, the
  decisions in `docs/besluiten.md`, the project's `AGENTS.md`.
- Deviating from a recorded decision is agreed with the developer and then
  recorded as a new decision.
- Not 100% sure? Ask. Never fill it in.
- Never, without the developer: touch `.env` files, reset or drop a database,
  deploy, merge, add a `release:` label, publish a gem, change a signing key.
- Do not just agree. If the developer's plan is weaker than an alternative or has
  a flaw (race, edge case, broken invariant), say so before building, with the
  reason. If it is fine, say so briefly and proceed. Change position only on an
  argument, not because the point was repeated.
