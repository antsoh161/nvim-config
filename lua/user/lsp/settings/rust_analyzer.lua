return {
  settings = {
    ["rust_analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
      inlayHints = {
        enable = true,
        auto = true,
        show_parameter_hints = true,
        parameter_hints_prefix = "",
        other_hints_prefix ="",
      },
    },
  },
}
