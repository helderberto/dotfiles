---
paths:
  - "**/*.{ts,tsx,js,jsx}"
---

# Performance

## Core Web Vitals targets

- **LCP** ≤ 2.5s (Largest Contentful Paint)
- **INP** ≤ 200ms (Interaction to Next Paint)
- **CLS** ≤ 0.1 (Cumulative Layout Shift)

## Rules

- **Measure first**: Never optimize without profiling. Use Lighthouse, DevTools Performance tab, or `React.Profiler`.
- **Identify the bottleneck**: Profile → find the slowest part → fix that. Don't guess.
- **One change at a time**: Measure before and after each optimization separately.

## Common pitfalls

- Unnecessary re-renders: missing `memo`, `useMemo`, `useCallback` where profiling shows cost
- O(n²) where O(n) works: nested loops over large collections
- Bundle bloat: importing entire libraries when tree-shaking fails (`import { x } from 'lib'` not `import lib`)
- Unoptimized images: missing `width`/`height`, no lazy loading below fold
- Layout thrashing: reading then writing DOM in loops
- Missing virtualization for long lists (>100 items)
