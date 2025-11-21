# Testing Principles

## Testing Tools

- **Jest** or **Vitest** for testing frameworks
- **React Testing Library** for **React** component testing
- **MSW (Mock Service Worker)** for API mocking when needed

## React Component Testing

```tsx
// Good Example - Testing user visible behavior
describe("MyComponent", () => {
  const defaultProps = {
    // Define default props here
    title: "Hello, World!",
    onClick: vi.fn(),
  };

  // Make it easier to render the component with default props
  const customRender = (props = {}) => {
    return render(<MyComponent {...defaultProps} {...props} />);
  };

  describe("Rendering", () => {
    it("renders with default content", () => {
      renderComponent();

      expect(screen.getByText("Hello, World!")).toBeInTheDocument();
      expect(screen.getByText(defaultProps.title)).toBeInTheDocument();
    });

    it("renders with custom props", () => {
      renderComponent({ title: "Custom Title" });

      expect(screen.getByText("Custom Title")).toBeInTheDocument();
    });
  });

  describe("User Interactions", () => {
    it("handles button click correctly", async () => {
      customRender();

      const button = screen.getByRole("button", { name: /click me/i });

      await user.click(button);

      expect(screen.getByText("Button Clicked!")).toBeInTheDocument();
      expect(defaultProps.onAction).toHaveBeenCalledTimes(1);
    });

    it("handles button click with custom handler", async () => {
      const customHandler = vi.fn();
      renderComponent({ onAction: customHandler });

      const button = screen.getByRole("button", { name: /click me/i });

      await user.click(button);

      expect(customHandler).toHaveBeenCalledTimes(1);
      expect(defaultProps.onAction).not.toHaveBeenCalled();
    });
  });

  describe("Edge Cases", () => {
    it("handles disabled state", () => {
      renderComponent({ disabled: true });

      const button = screen.getByRole("button", { name: /click me/i });

      expect(button).toBeDisabled();
    });

    it("does not trigger action when disabled", async () => {
      renderComponent({ disabled: true });

      const button = screen.getByRole("button", { name: /click me/i });

      await user.click(button);

      expect(defaultProps.onAction).not.toHaveBeenCalled();
    });
  });
});
```
