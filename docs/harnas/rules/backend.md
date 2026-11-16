# Backend

- **Vanilla Rails, 37signals style.** Business logic lives in models and
  concerns. A controller loads, authorizes, orchestrates and renders, in well
  under ~10 lines per action. Shared controller behaviour goes in a concern.
- State with behaviour or history is a record, not a boolean: `Pin`, `Archive`,
  `Favorite`, `Completion`, `Suspension`.
- Controllers are RESTful. Something that is not CRUD becomes a new resource
  (`resource :pin`), never a custom member action.
- A **service object** only when the logic fits nowhere in the domain: several
  models, external I/O, a multi-step process. Stateless, plain parameters, one
  public entry. (Portfolio uses more of them; that is a project deviation.)
- Scopes over raw SQL. No N+1; Bullet raises on one in test.
- **Jobs** (Solid Queue) are thin and call one model method.
- **Authentication** is Rails-native with `Current`, no auth gems. Every login
  path goes through one method (`start_new_session_for`).
- **Authorization** goes through `Current.user` (or the project's policy object).
  Never check a role or permission by hand in a view or controller.
- Strong parameters with `params.expect` / `params.permit`. Never `to_unsafe_h`
  into a model.
- Money is stored in cents as an integer.
- Sensitive fields are encrypted with Active Record encryption where the project
  already does so; matching and sorting on those columns happens in Ruby. Never
  `LIKE`, `ORDER BY` or full-text on an encrypted column.
- Files go through Active Storage. Never write to a hardcoded path.
- Time-based behaviour uses the user's time zone; store UTC.
- Every user-facing string is a locale key (see `frontend.md`).
