return {
	-- General plugins for debugging
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"mfussenegger/nvim-dap",
		keys = function()
			local dap = require("dap")
			-- local widgets = require("dap.ui.widgets")
			return {
				-- VSCode style
				{ "<F5>", dap.continue },
				{ "<F10>", dap.step_over },
				{ "<F11>", dap.step_into },
				{ "<F12>", dap.step_out },
				-- NVim style
				{ "<leader>dc", dap.continue, desc = "Continue" },
				{ "<leader>dO", dap.step_over, desc = "Step over" },
				{ "<leader>di", dap.step_into, desc = "Step into" },
				{ "<leader>do", dap.step_out, desc = "Step out" },
				{ "<Leader>db", dap.toggle_breakpoint, desc = "Set breakpoint" },
				{ "<Leader>dB", dap.set_breakpoint, desc = "Toggle breakpoint" },
				--{
				--	"<Leader>dl",
				--	function()
				--		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				--	end,
				--},
				{ "<Leader>dr", dap.repl.open, desc = "Open REPL" },
				{ "<Leader>dl", dap.run_last, desc = "Run last configuration" },
				{
					"<Leader>dh",
					dap.hover,
					mode = { "n", "v" },
					desc = "Hover",
				},
				{
					"<Leader>dp",
					dap.preview,
					mode = { "n", "v" },
					desc = "Preview",
				},
				--},
			}
		end,
		-- The part below requires nvim-dap-ui for auto UI startup
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = dapui.open
			dap.listeners.before.launch.dapui_config = dapui.open
			dap.listeners.before.event_terminated.dapui_config = dapui.close
			dap.listeners.before.event_exited.dapui_config = dapui.close
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
	},
	-- Preconfigured profiles for debugging
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup()
		end,
	},
}
