---
paths:
  - "**/*.{css,scss}"
  - "**/*.tsx"
---

# Styles

- Plain CSS: a CSS Module per component, design tokens in one global stylesheet. No CSS-in-JS or utility frameworks unless the project already uses one
- Colors, fonts, radii, shadows and spacing scales come from CSS variables. Themes override variables, not rules
- No color literals in components or modules. Add or reuse a token; derive new ones with `color-mix()` so every theme follows
- Lengths and font sizes in `rem`, `0.0625rem` for hairlines, so layouts follow the reader's text size. `%`, `vw`/`vh`, `fr` and `ch` when the size is relative to something else
- Print-only stylesheets may use `pt` and `mm` for paper geometry
- Font stack in a variable. System fonts unless the project ships its own
- CSS over JS for layout, states and animation
- Respect `prefers-reduced-motion`
- `::backdrop` doesn't inherit custom properties in older browsers: keep its values literal
