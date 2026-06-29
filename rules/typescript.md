# TypeScript Rules

- Always use strict mode (`strict: true` in tsconfig).
- Never use `any`. Use `unknown` and narrow types explicitly.
- Prefer interfaces over type aliases for object shapes.
- Use Zod for runtime validation at API boundaries and AI outputs.
- Never cast with `as` to silence type errors. Fix the root type.
- Keep types colocated with the code that uses them. No giant `types.ts` files.
- Use `satisfies` over `as` when you need to check a value matches a type.
