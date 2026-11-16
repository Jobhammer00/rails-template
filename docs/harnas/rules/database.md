# Database

- A schema or data change is made only with the developer's approval, with the
  impact and, if needed, an ERD. Always normalized; design for later use.
- Adding a migration is fine. Running it anywhere other than locally is not.
- Never reset, drop or `db:migrate:reset` / `db:schema:load` a database without
  permission, locally included.
- Migrations stay simple (no `column_exists?` guards). Index every foreign key and
  every queried column. `strong_migrations` is on; follow its advice.
- A one-off data backfill is a separate, explicit step, asked first, not hidden in
  a schema migration.
- After a migration the running dev server keeps the old column list: restart it
  (`docker compose restart web` where Docker is used).
- Seeds: `db/seeds.rb` must stay valid; CI replants it in test. Seeds never contain
  real external email addresses. Dev users are `<name>@<app>.test`.
- Production: PostgreSQL as a Kamal accessory (`<app>-postgres`) on the same host.
  Back-ups are the developer's concern; a change that touches back-up or restore
  code comes with a spec for the restore.
