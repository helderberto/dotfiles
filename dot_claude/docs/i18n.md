# Internationalization

## Principles

- All user-facing text must go through i18n (no hardcoded strings in JSX)
- Define messages declaratively, reference by key
- Parameterize dynamic values — never concatenate strings

## Message Definition

- Define messages using `defineMessage` / `defineMessages`
- Use `intl.formatMessage(message, values)` for rendering
- Never template literals for user-facing text: `` `${count} items` `` → use ICU message syntax `{count} items`

## Testing with AST-compiled Messages

Some setups compile messages to AST at build time (e.g., `ast: true` in formatjs babel plugin). This means parameterized messages like `{count} active` may render variable names literally in tests.

**Workaround**: Assert on structure (roles, test IDs) rather than interpolated message text. Or mock the intl module to return raw strings.

## Gotchas

- Whitespace between elements: use layout (Flex/gap) instead of `{' '}` string literals — linters flag literal strings in JSX
- Format functions (dates, numbers, plurals) should use intl formatters, not manual formatting
