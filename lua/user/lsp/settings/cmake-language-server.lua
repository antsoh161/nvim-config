return {
  settings = {
    languageserver = {
      cmake = {
        command = "cmake-language-server",
        filetypes = "cmake",
        rootPatterns = "build/",
        initializationOptions = {
          buildDirectory = "build",
        }
      }
    }
  }
}
