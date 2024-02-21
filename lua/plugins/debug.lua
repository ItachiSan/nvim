return {
	-- General plugins for debugging
	{
		"mfussenegger/nvim-dap",
		keys = function()
			local dap = require("dap")
			-- local widgets = require("dap.ui.widgets")
			return {
				{ "<F5>", dap.continue },
				{ "<F10>", dap.step_over },
				{ "<F11>", dap.step_into },
				{ "<F12>", dap.step_out },
				{ "<Leader>db", dap.toggle_breakpoint },
				{ "<Leader>dB", dap.set_breakpoint },
				--{
				--	"<Leader>dl",
				--	function()
				--		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				--	end,
				--},
				--{ "<Leader>dr", dap.repl.open },
				--{ "<Leader>dl", dap.run_last },
				--{
				--	"<Leader>dh",
				--	widgets.hover,
				--	mode = { "n", "v" },
				--},                --{
				--	"<Leader>dp",
				--	widgets.preview,
				--	mode = { "n", "v" },
				--},
				--{
				--	"<Leader>df",
				--	function()
				--		widgets.centered_float(widgets.frames)
				--	end,
				--},
				--{
				--	"<Leader>ds",
				--	function()
				--		widgets.centered_float(widgets.scopes)
				--	end,
				--},
			}
		end,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = dapui.open
			dap.listeners.before.launch.dapui_config = dapui.open
			dap.listeners.before.event_terminated.dapui_config = dapui.close
			dap.listeners.before.event_exited.dapui_config = dapui.close
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	},
	-- Preconfigured profiles for debugging
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup()
		end,
	},
}
