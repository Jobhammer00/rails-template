# Inloggen en account

## What it does

A user signs in with email address and password, resets a forgotten password through a mailed link (valid 15 minutes), and changes their password under Instellingen with their current password as the check.

## Where it lives

- `SessionsController`, `PasswordsController`, `SettingsController`; the `Authentication` concern and `Current`.
- Views: `app/views/sessions/new.rb`, `app/views/passwords/{new,edit}.rb`, `app/views/settings/show.rb`.
- Specs: `spec/requests/{sessions,passwords,settings}_spec.rb`.

## Rules

- Sign-in and reset are rate limited (10 per 3 minutes).
- A reset never says whether an address exists.
- Resetting a password ends every session of that user.
