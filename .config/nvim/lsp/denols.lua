return {
  filetypes = {
    "javascript",
    "typescript",
  },
  root_markers = { "deno.json", "deno.jsonc" },
  settings = {
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
        },
      },
    },
  },
}
