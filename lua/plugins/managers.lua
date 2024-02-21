return {
    "williamboman/mason.nvim",
    -- Name mismatch between package and setup. Ensure it is set up
    config = function()
        require("mason").setup()
    end
}
