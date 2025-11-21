This document contains guidelines, rules, and constraints for Claude's behavior when working on this codebase. Following these rules is mandatory and applies to all interactions. If you want an exception to any of these rules, YOU MUST first get explicit approval from the user.

## Foundational Rules

- Honesty, truthfulness, and transparency are the most important values you share with the user
- You and the user are collaborators working together to solve problems collaboratively as equals
- It is more important to solve problems correctly rather than quickly, never rush, skip steps, or take shortcuts
- **TEST-DRIVEN DEVELOPMENT IS NON-NEGOTIABLE.** Every single line of production code must be written in response to a failing test. No exceptions.

## Communication Guidelines

Clear, concise communication is paramount to working efficiently together.

- The user prefers direct communication without unnecessary pleasantries or agreeableness
- Challenge ideas and suggestions that you believe are incorrect or suboptimal - the user is depending on your expertise
- Never make assumptions about what the user wants or needs, always ask questions to clarify
- You MUST ask questions whenever you are uncertain about a concept or need additional information to proceed

### Asking Questions Efficiently

Efficient question formatting reduces response time and cognitive load for users.

#### Binary Choice Questions

Use clear yes/no questions when there are only two possible outcomes.

**Good phrasing:**

> We have completed planning, would you like me to begin implementation?

#### Multiple Choice Questions

Use numbered lists to present choices so that the user may simply respond with the number.

**Good phrasing:**

> Would you like to:
>
> 1. Accept the suggestion
> 2. Reject the suggestion
> 3. Adjust the suggestion

#### Open-Ended Questions

Only use open-ended questions for complex scenarios that do not fit into the classifications above.

## TypeScript & Code Quality Standards

### Type Safety

- **Strict mode**: Always use TypeScript strict mode
- **No `any` types**: Never use `any` or type assertions (`as Type`) - this defeats the purpose of TypeScript
- **Interfaces over types**: Favor interfaces for object shapes, use types for deriving and combining interfaces
- Use real schemas/types in tests, never redefine them

### Exports & Imports

- Always use named exports, never default exports or `* as` exports
- Use path aliases for imports: `src/components/Header` instead of `../../components/Header`
- Use relative paths only in `index.ts(x)` files

### File Naming

- All files use kebab-case: `alert-widget.tsx`, `use-analytics.ts`
- Component files: `component-name.tsx`
- Test files: `component-name.test.tsx`
- Message files: `component-name.messages.tsx`
- Story files: `component-name.stories.tsx`

### Code Comments

- Comments should serve as guidance for future maintainers and reviewers
- Focus on the "why" rather than the "what"
- Focus on the "how" only when the implementation is non-obvious
- Never simply restate what the code is doing
- Document business behavior and domain logic

### Enums

- Prefer plain objects and string unions over enums
- Enums are not officially supported in ECMAScript

## Testing Principles

### Test-Driven Development (TDD)

- Write tests first, always
- Every line of production code must be written in response to a failing test
- Tests must document expected business behavior
- **100% coverage is expected**, but tests must be based on business behavior, not implementation details

### Behavior-Driven Testing

- **No "unit tests"** - this term is not helpful. Tests should verify expected behavior
- Test through the public API exclusively - internals should be invisible to tests
- No 1:1 mapping between test files and implementation files
- Tests that examine internal implementation details are wasteful and should be avoided
- Treat implementation as a black box

### Testing Tools

- **Vitest** or **Jest** for testing frameworks
- **React Testing Library** for React components
- **MSW (Mock Service Worker)** for API mocking
- All test code must follow the same TypeScript strict mode rules as production code

## Working with Git

You MUST NOT stage or commit changes unless explicitly instructed to do so.

## Working with GitHub

Make use of the `gh` CLI tool to interact with GitHub.

## Functional Programming Principles

- Prefer immutable data patterns
- Write small, pure functions
- Avoid side effects where possible
- Use immutable state management patterns
