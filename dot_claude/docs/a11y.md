# Accessibility

## Semantic HTML First

- Use `<button>`, `<a>`, `<nav>`, `<main>`, `<section>`, `<header>` over `<div>` with roles
- ARIA is a last resort, not a first choice — if a native element does the job, use it
- `<div>` and `<span>` have no semantic meaning — avoid them for interactive elements

## Interactive Elements

- Buttons for actions, links for navigation — never swap them
- All interactive elements must be keyboard accessible (focusable + activatable)
- Visible focus indicators — never `outline: none` without a replacement
- Disable states must be communicated: `aria-disabled` or `disabled` attribute

## Images & Icons

- Decorative: `aria-hidden="true"` or empty `alt=""`
- Informative: descriptive `alt` text
- Icon-only buttons: always add `aria-label`

## Forms

- Every input needs a visible `<label>` (or `aria-label` if visually hidden)
- Error messages linked to inputs via `aria-describedby`
- Required fields: use `required` attribute, not just visual indicators

## Dynamic Content

- Status updates: use `role="status"` or `aria-live="polite"` for non-urgent updates
- Alerts: `role="alert"` or `aria-live="assertive"` for urgent messages
- Loading states: communicate to screen readers (`aria-busy`, status messages)

## Testing

- `getByRole` as primary query — if it can't find the element, the a11y is likely wrong
- `getByLabelText` for form controls
- `getByText` for static content
- Avoid `getByTestId` — use as last resort only
