# Testing

- **RSpec, always.** An existing Minitest app (habittrack, uitgaven, lookout,
  portfolio) stays Minitest until it is migrated; never two frameworks in one
  project.
- Fixtures, not factories. Fixtures are loaded globally and bypass callbacks, so a
  `NOT NULL` column without a database default is set in the fixture.
- **Request specs are the default** (`render_views` implicit). System specs only
  where the project already has them; for JavaScript behaviour use a request spec
  or a check in `spec/scripts`.
- Every behaviour change comes with specs, and every bugfix with a regression spec.
  A spec fails without the code it covers.
- Test behaviour, not mocks.
- Bullet raises on an N+1 in test.
- An i18n parity spec fails on a missing `nl` or `en` key.
- Native: a spec pairs every Stimulus bridge component with its Kotlin factory, and
  one compares the path configuration with the bundled asset.
- Gating, rate limits and other production-only behaviour are off in test; a spec
  that depends on them turns them on explicitly.
- Run the tests through the project's wrapper (`bin/test` where it exists), never a
  bare `bundle exec rspec` that can leave a process behind.
