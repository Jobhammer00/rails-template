# Android release

- The version is the release tag. Gradle reads `VERSION` from the Release
  workflow, else the latest `v*` tag. `versionCode` is `EPOCH.MAJOR.MINOR.PATCH`
  with two digits per segment (0.1.0.0 becomes 10000), so every segment stays
  under 100. Never bump by hand.
- `Jobhammer00/deploy`'s `android.yml` builds the signed bundle for the tag and
  uploads it to the Play **internal** track. Promoting is done in the Play Console
  by the developer. `bin/release-android` builds the same bundle locally.
- Signing never comes from the repo: `~/.gradle/gradle.properties`, `-P` flags, or
  environment variables that `bin/release-android` fills from 1Password. The upload
  keystore lives in `~/keys/` with a backup in 1Password. Losing the key means no
  more updates for that `applicationId`; the `applicationId` is permanent once on
  Play.
- R8 runs on release builds only. Something that works in debug and breaks from
  Play needs a keep rule in `proguard-rules.pro`; test with `-P<app>.minifyDebug`.
- `google-services.json` (push) is gitignored. Without it the app builds and runs
  but registers no push.
- The Android job in `release.yml` stays commented out until the Play service
  account and Firebase items exist in 1Password.
