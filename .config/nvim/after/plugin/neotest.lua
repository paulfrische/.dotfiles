require('neotest').setup({
    adapters = {
        require("neotest-python")({
            runner = "pytest",
        })
    }
})
