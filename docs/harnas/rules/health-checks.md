# Health checks

- Every app answers Rails' `/up`, locally too (the Docker healthcheck uses it) and in
  production, where Lookout checks it per project.
- Every scheduled job and back-up in production reports a heartbeat to Lookout
  with `lookout_client` (pin a tag in the Gemfile). The token is a Kamal secret
  (`LOOKOUT_TOKEN`), one per app, issued with
  `bin/kamal app exec --interactive --reuse "bin/rails lookout:token[<app>]"`.
- An external integration (Gmail, Google, push, billing) has a health task that
  exits non-zero on failure (`bin/rails gmail:health_check`), usable by monitoring.
- A critical background process (queue, scheduler) must show up as failed
  somewhere the developer looks, not only in a log.
- Errors worth knowing about are visible in the app's own error tracking or
  admin, readable, not only in a log file.
