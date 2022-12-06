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
      inlay_hints = {
        auto = true,
        only_current_line = true,
        show_parameter_hints = true,
        parameter_hints_prefix = "",
        other_hints_prefix ="",
      },
    },
  },
}
