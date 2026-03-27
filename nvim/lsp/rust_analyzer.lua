-- installed via: Mason (rust-analyzer)
return {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = { command = "clippy" },
		},
	},
}
