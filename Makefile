.PHONY: bootstrap
bootstrap:
	@$(MAKE) brew
	@$(MAKE) install_tuist
	@$(MAKE) pre-commit-install
	@$(MAKE) tuist_generate

.PHONY: brew
brew:
	@brew bundle --no-lock

.PHONY: install_tuist
install_tuist:
	@if ! command -v tuist &> /dev/null; then \
    	curl -Ls https://install.tuist.io | bash; \
	fi

.PHONY: pre-commit-install
pre-commit-install:
	@pre-commit install
	@pre-commit install -t post-checkout -t post-merge

.PHONY: test
test:
	xcodebuild test -workspace Calculator.xcworkspace -scheme $$scheme Calculator -destination "platform=macOS,arch=arm64"

.PHONY: tuist_edit
tuist_edit:
	@tuist edit

.PHONY: tuist_generate
tuist_generate:
	@tuist generate --no-open
