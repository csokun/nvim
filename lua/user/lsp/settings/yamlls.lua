return {
  yaml = {
    schemas = {
      ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/deployment-apps-v1.json"] = "/*",
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
    },
    schemaStore = {
      url = "https://www.schemastore.org/api/json/catalog.json",
      enable = true,
    }
  }
}
