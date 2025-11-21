# Code Style

## Functional Programming

- Prefer immutable data patterns
- Write small, pure functions
- Avoid side effects where possible
- Avoid heavy FP abstractions (e.g., monads, pipe/compose) unless justified
- Use array methods (`map`, `filter`, `reduce`) over imperative loops

## Immutability Violations

### Array Mutations

```ts
// ❌ WRONG - Array mutations
items.push(newItem);
items.pop();
items.splice(0, 1);
items.shift();
items.unshift(newItem);
items[0] = updatedItem;
items.sort();
items.reverse();

// ✅ CORRECT - Immutable alternatives
const withNew = [...items, newItem];
const withoutLast = items.slice(0, -1);
const withoutFirst = items.slice(1);
const withFirst = [newItem, ...items];
const updated = items.map((item, i) => (i === 0 ? updatedItem : item));
const sorted = [...items].sort();
const reversed = [...items].reverse();
```

### Object Mutations

```tsts
// ❌ WRONG - Object mutations
obj.key = newValue;
delete obj.key;

// ✅ CORRECT - Immutable alternatives
const updatedObj = { ...obj, key: newValue };
const { key, ...rest } = obj;
const withoutKey = { ...rest };
```

## Code Structure

- **No nested if statements** use guard clauses, early returns, or composition
- **Avoid deep nesting** in general (max 2 levels)
- **Single Responsibility Principle** each function/module should have one clear purpose
- **Consistent naming conventions** use camelCase for variables/functions, PascalCase for types/components
- **Small functions** focusing on a single responsibility

## Naming Conventions

- **Functions**: camelCase, verb-based (e.g., `fetchData`, `calculateTotal`, `validateInput`)
- **Types**: PascalCase, noun-based (e.g., `UserProfile`, `OrderItem`, `ApiResponse`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `MAX_RETRIES`
- **Files**: kebab-case (e.g., `user-profile.ts`, `data-fetcher.ts`, `form-group.tsx`)
- **Test Files**: `*.test.ts{x}` or `*.spec.ts{x}`

## No Comments in Code

Code should be self-explanatory. Avoid comments that restate what the code does. Use comments only to explain the "why" behind complex logic or decisions.

## Prefer Objects Options

Use object options for functions with more than 2 parameters

```ts
// ❌ WRONG - Multiple positional parameters
function createUser(
  name: string,
  age: number,
  isAdmin: boolean,
  email: string,
) {
  // function body
}

// ✅ CORRECT - Object Options
function createUser(options: {
  name: string;
  age: number;
  isAdmin: boolean;
  email: string;
}) {
  const { name, age, isAdmin, email } = options;
  // function body
}
```

**When positional parameters are allowed:**

- Single-parameter pure functions (e.g., `square(x)`)
- Math operations (e.g., `add(a, b)`)
