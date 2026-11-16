# Besluiten

- **T1 — Basis uit vier apps.** Het template is gebouwd uit wat notesk, habittrack, portfolio en gvexcelsior gemeen hebben, plus de stubs uit `harnas-rails`. De admin-laag van portfolio en gvexcelsior (rechten, uitnodigingen, auditlog, passkeys) zit er bewust niet in; een app die het nodig heeft, voegt het toe.
- **T2 — Harnas als kopie.** `docs/harnas/` is een kopie van `harnas-rails`, zodat een agent op een verse checkout de regels heeft. Wijzigingen gaan eerst in `harnas-rails`.
- **T3 — Geen credentials in het template.** Het template is publiek; elke app maakt zijn eigen `credentials.yml.enc` met `bin/rails credentials:edit`.
