return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- общее поведение при подключении
      local on_attach = function(_, bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd",        vim.lsp.buf.definition,        opts)
        vim.keymap.set("n", "K",         vim.lsp.buf.hover,             opts)
        vim.keymap.set("n", "gi",        vim.lsp.buf.implementation,    opts)
        vim.keymap.set("n", "<c-k>",     vim.lsp.buf.signature_help,    opts)
        vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition,   opts)
        vim.keymap.set("n", "<Leader>lr",vim.lsp.buf.rename,            opts)
        vim.keymap.set({ "n","v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
      end

      local caps = vim.lsp.protocol.make_client_capabilities()
      local base = { on_attach = on_attach, capabilities = caps }

      local function setup(server, opts)
        opts = vim.tbl_deep_extend("force", base, opts or {})
        -- 1) объявляем конфиг
        vim.lsp.config(server, opts)
        -- 2) включаем (активирует на открытых буферах подходящего filetype и на будущих)
        vim.lsp.enable(server)
      end

      -- Lua
      setup("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      -- TypeScript (новое имя сервера)
      setup("ts_ls")
      -- Если ты используешь другой сервер (vtsls и т.п.), этот вызов замени на нужный.
    end,
  },
}
