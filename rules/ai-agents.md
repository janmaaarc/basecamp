# AI & Automation Rules

- Minimize API calls. Batch where possible.
- Design for idempotency. Same input = same result.
- Add retries with exponential backoff on transient errors.
- Always validate AI output structure before using it.
- Never trust raw LLM output. Parse and validate every field.
- Prefer structured outputs (JSON schema) over free text.
- Log meaningful errors with context, not just "AI call failed".
- Never embed credentials directly in workflow or agent config. Use the platform's credential store by reference only.
- Ground responses in available data. Avoid hallucination by limiting scope.
