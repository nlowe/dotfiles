.PHONY: diff
diff:
	chezmoi apply --dry-run --verbose

apply:
	chezmoi apply
