# Data & Database Rules

- Never run destructive queries (DROP, DELETE, TRUNCATE) without a backup plan.
- Always test migrations on a copy before running on production.
- Index foreign keys and frequently filtered columns.
- Use transactions for multi-step writes.
- Validate data types and constraints at the schema level, not just app level.
- Never store passwords in plain text. Always hash.
- Log schema changes with timestamps and author.
