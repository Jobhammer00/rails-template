# Clean code

- The lazy solution that works is the right one. Order: what is already in the
  codebase, then Rails, then a gem that is already installed, then new code.
- No abstraction for one user, no config for a value that never changes, no
  interface with one implementation.
- A race that does not happen in practice gets a unique index, not a retry.
- Remove dead code and documentation that is no longer true, in the same PR.
- **Comments**: do not write them. Write one only when the code cannot carry the
  reason: a constraint from outside the file (a browser quirk, framework
  ordering), a workaround whose removal would silently bring a bug back, or a
  `ponytail:` marker naming the ceiling of a deliberate shortcut. If the reason
  fits in a name, rename. The explanation belongs in the commit message.
- Solve a problem where it arises. Something missing in the CI image or the shared
  workflow is fixed there, not worked around in the app.
