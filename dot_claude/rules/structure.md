---
paths:
  - "src/**/*.{ts,tsx}"
---

# Structure

Layout for TypeScript and React apps. Framework conventions win where they collide (Next.js `app/`, TanStack Start `routes/`): fixed file names, default exports, route folders. A repo with its own layout keeps it; propose a migration as a separate change.

## Layout

```
src/                  imported as @/… (map @/* in tsconfig, bundler and test runner)
├── components/       shared UI, exposed through index.ts
├── features/<name>/  deep modules, entered only through index.ts
├── views/            page bodies composing features and components
├── hooks/            hooks shared by 2+ features
├── types/            domain types and DTOs, one file per domain
├── utils/            helpers shared by 2+ features
└── lib/<library>/    one wrapper per third-party library
```

- `components/index.ts` is the barrel: `import { Button } from '@/components'`
- A feature exports a small interface from `index.ts`. Import `@/features/<name>`, never a file inside it
- Route files load data, set metadata and render a view. Views hold layout and composition, no logic
- Code one feature uses (component, hook, helper) lives in that feature. Promote it to `components/`, `hooks/` or `utils/` when a 2nd feature needs it
- `lib/<library>/index.ts` re-exports what the app uses, configured once. Tests import from `@/lib/testing-library`. Import the framework (React, Next.js, TanStack) directly
- `vi.mock('<package>')` still works on a wrapped package: the wrapper re-exports the mocked module

## External data

- Type what crosses the boundary (API response, frontmatter, storage) as a DTO in `types/`: `OrderDto { order_id, created_at }`
- Map it to the domain type in the feature: `toOrder(dto)` → `{ id, createdAt }`. Components, views and hooks see domain types only
- Each mapper gets unit tests

## Files

- kebab-case files and folders: `order-summary.tsx`, `use-cart.ts`, `order-summary.module.css`
- Named exports and imports. Default export only where the framework requires it
- Each implementation file has a sibling `<name>.test.ts(x)`. Barrels and type-only files don't
- Across folders import through `@/`; within one folder through `./`
