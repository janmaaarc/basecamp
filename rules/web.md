# Web Development Rules

- Validate all user inputs at the API boundary.
- Never expose secrets or service keys client-side.
- Use environment variables for all config. No hardcoded values.
- Sanitize outputs to prevent XSS.
- Use parameterized queries. No string-concatenated SQL.
- Auth-gate every route that touches user data.
- Return consistent error shapes. Never leak stack traces to clients.
