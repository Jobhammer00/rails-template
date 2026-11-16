# Frontend

- **Turbo before Stimulus.** Frames, streams and morph refreshes first. A Stimulus
  controller is small, does one thing and is loaded by file name.
- **Components**, in this order: an existing RubyUI component, a new RubyUI
  component (`bin/rails g ruby_ui:component <Name>`), a Phlex component, ERB. In
  ERB prefer tag helpers over raw HTML. One reusable component per concept; no
  component full of if-statements. An app without Phlex stays with ERB.
- **Tailwind utilities and tokens.** No hardcoded colours, shadows, radii, text
  sizes or inline styles (a CSS variable is the one exception). A new token goes in
  the theme (`:root`, dark mode, and the Tailwind theme). A destructive action is
  red. Dark mode works.
- Every script tag carries the CSP nonce (`erb_lint` enforces it).
- Icons are **Lucide**, vendored in `vendor/lucide/icons`. A missing one is added
  from `lucide-static`, not hotlinked.
- **Internationalization**: every user-facing string is a locale key, `nl` and
  `en`, with a parity spec that fails on a missing key. A message is readable and
  uses the words of the screen; never a column name or a key.
- Nothing fails silently: every save gives feedback with the name in it, and every
  validation error is visible.
- A screen change animates with View Transitions on the web; page content has no
  entrance animation (it replays on every morph refresh).
- Keep DOM glue in the Stimulus controller and decisions on the server. Always
  handle a rejected promise and show a message.
- A mobile view tree (`app/views/mobile`) needs a twin for every shared view; a
  partial without a twin renders on both.
