return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")
      jdtls.start_or_attach({
        cmd = { "jdtls" },
        root_dir = require("jdtls.setup").find_root({ "mvnw", "gradlew", ".git" }),
      })
    end,
  },
}
