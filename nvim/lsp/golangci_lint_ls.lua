-- installed via: Mason (golangci-lint-langserver + golangci-lint)
return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		golangci_lint_ls = {
			command = {
				"golangci-lint",
				"run",
				"--out-format",
				"json",
				"--issues-exit-code=1",
			},
		},
	},
}
