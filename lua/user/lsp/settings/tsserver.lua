return {
  -- https://github.com/typescript-language-server/typescript-language-server#initializationoptions
  init_options = {
    preferences = {
      disableSuggestions = false,
      includeCompletionsWithSnippetText = true,
      includeCompletionsForImportStatements = true,
      includeInlayEnumMemberValueHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayVariableTypeHints = true,
    },
  },

}
