# Security Rules

- Never store secrets in code. Use environment variables.
- Never log sensitive data (tokens, passwords, PII).
- Validate and sanitize all user inputs at the API boundary.
- Use parameterized queries. Never concatenate SQL strings.
- Set secure, httpOnly, sameSite cookies for auth tokens.
- Never expose stack traces or internal errors to clients.
- Use HTTPS everywhere. No mixed content.
- Hash passwords with bcrypt or argon2. Never md5 or sha1.
- Rate limit auth endpoints.
- Check dependencies for known vulnerabilities before adding them.
