# Hotwire Native Android

Reference implementation: `~/Projects/notesk/android` and its `notesk-android`
skill. The shell is thin: native navigation and native chrome around Rails pages
in a WebView.

## Who owns what

- **No business logic in Kotlin.** Almost every "Android bug" is a Rails bug. Look
  at the mobile views and the bridge components first.
- Wrong text, layout, list, sheet: Rails. Native toolbar, status bar, keyboard,
  billing, widgets: a bridge component. Insets, splash, system back: `main/`.
- A change to a `bridge--*` Stimulus controller and its Kotlin component ships in
  one PR. Rails is deployed, Kotlin is released, so Rails stays tolerant of an
  older install.

## Chrome: native components, always

- **An Android shell always uses the native components** (toolbar, status bar,
  keyboard, and so on) through bridge components. Web chrome is hidden only where
  a native component takes its place.
- **If the app also has a PWA**, both are maintained: the web chrome for the
  browser and the PWA, the native components for the shell. When they conflict,
  **native wins.**
- Hide web chrome on `bridge_component?(:name)`, **never** on `hotwire_native_app?`.
  An older install is still native but may lack the component that puts the title
  or account button back.

## Rails side

- Every bridge component exists twice: `static component = "…"` in
  `app/javascript/controllers/bridge/*_controller.js` and a
  `BridgeComponentFactory("…")` in the Application class. A spec pairs them.
- Navigation rules come from Rails (`ConfigurationsController`,
  `/configurations/android.json`) and are also bundled in
  `android/app/src/main/assets/json/path-configuration.json`. Keep them equal; a
  request spec fails when they drift.
- A path rule matches path and query: without `([?].*)?$` it misses the list once
  a filter changes the URL.
- A download is `download: true` in the path rules. Leaving an editor is a
  `replace`, or back lands on the screen just left.
- A form in a modal sends `native=recede` so the shell closes it.
- No Turbo link prefetch in the native shell.
- Native headers in specs come from a `native_headers` helper. Test mobile views
  with a mobile User-Agent; a narrow viewport is not enough.

## Kotlin side

- One `:app` module, package `nl.<app>`, `minSdk` 28, `compileSdk`/`targetSdk` 36,
  JDK 17. Library versions follow `notesk/android/README.md`; update them in every
  app together.
- Sources in `app/src/main/kotlin/nl/<app>/`: `bridge/`, `widget/` (Glance),
  `push/`, `billing/`, `routing/`. One bridge component per responsibility.
- **Insets**: `env(safe-area-inset-bottom)` is the navigation bar inside the
  WebView. The host pads for the keyboard only; the pages own the bars. Padding
  for both counts it twice. Native sheets pad for system bars and keyboard.
- The page decides the chrome colours, not the Android theme: it sends canvas and
  ink over the bridge. `Theme.<App>` (DayNight) only covers the first frames.
- A new screen's toolbar stays invisible until its component configures it, so the
  framework's plain arrow never shows over the loader.
- Start URL per build type from Gradle properties (`<app>.devStartUrl`,
  `<app>.startUrl`). Debug points at `http://10.0.2.2:<port>`. Cleartext HTTP lives
  only in `src/debug/AndroidManifest.xml`.
- Verify yourself: the Rails specs for native, `./gradlew :app:assembleDebug`, and
  an install on the emulator with adb/logcat. The final check on a real device is
  the developer's.
