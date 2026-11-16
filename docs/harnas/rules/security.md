# Security

- Trust no client input. Verify provider claims (`email_verified`), verify
  signatures before acting, make challenges single-use, and keep CSRF on every
  state-changing request.
- Rate-limit authentication endpoints (`rack-attack` or Rails `rate_limit`).
- Sensitive actions sit behind a recent-authentication check where the project has
  one (`SudoMode`).
- Decisions in pure, testable objects, and fail closed.
- Secrets never enter the repo, the docs or a transcript. They come from
  1Password through `.kamal/secrets`; the Rails master key is the only thing the
  server needs.
- Never touch `.env` files. `.env.example` is code and changes like any file.
- Brakeman, `bundler-audit` and `importmap audit` run in CI and stay green.
- Test data contains no real external email addresses.
