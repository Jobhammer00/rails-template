# <Feature name>

One or two sentences: what the user gets. No implementation talk.

## What it does

Bullets of user-visible behaviour, one per capability. Say who can do it
(owner, member, admin, premium, beta) and on which surfaces (desktop, mobile,
Android, Electron).

## Where it lives

| Layer | Files |
|---|---|
| Models / concerns | `app/models/...` |
| Controllers / routes | `app/controllers/...` |
| Views | desktop `app/views/...`, mobile twin `app/views/mobile/...` |
| JS | `app/javascript/controllers/...` |
| Native / Electron | only when it takes part |
| Specs | `spec/...` |

## Rules and gotchas

Constraints a change must respect (encryption, broadcasts, gating, twins,
i18n). Only what is not obvious from the code.

## Related

Other feature docs, deep-dive docs in `docs/`, skills.
