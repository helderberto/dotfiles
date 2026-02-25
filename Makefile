.PHONY: help test diff apply doctor clean

CHEZMOI_SOURCE := $(PWD)/chezmoi

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

test: ## Run comprehensive test suite
	@./test-chezmoi.sh

test-quick: ## Quick test (doctor + data only)
	@echo "🔍 Testing chezmoi configuration..."
	@chezmoi doctor --source "$(CHEZMOI_SOURCE)" || true
	@echo "\n📊 Configuration data:"
	@chezmoi data --source "$(CHEZMOI_SOURCE)"

diff: ## Show what would change
	@echo "📝 Showing diff of changes..."
	@chezmoi diff --source "$(CHEZMOI_SOURCE)"

dry-run: ## Preview apply (dry-run)
	@echo "🧪 Dry-run apply..."
	@chezmoi apply --dry-run --verbose --source "$(CHEZMOI_SOURCE)"

apply: ## Apply chezmoi (CAREFUL!)
	@echo "⚠️  About to apply chezmoi changes!"
	@echo "Press Ctrl+C to cancel, Enter to continue..."
	@read
	@chezmoi apply --source "$(CHEZMOI_SOURCE)"
	@echo "\n✅ Applied! Validating setup..."
	@./validate-setup.sh

doctor: ## Run chezmoi health checks
	@chezmoi doctor --source "$(CHEZMOI_SOURCE)"

clean: ## Remove applied chezmoi files (DESTRUCTIVE!)
	@echo "🗑️  This will remove all chezmoi-managed files!"
	@echo "Press Ctrl+C to cancel, Enter to continue..."
	@read
	@chezmoi purge --source "$(CHEZMOI_SOURCE)"

status: ## Show git status
	@git status --short

