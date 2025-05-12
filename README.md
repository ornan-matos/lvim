
## 📁 Estrutura do Repositório

* **`config.lua`**: Arquivo principal de configuração do LunarVim, localizado em `~/.config/lvim/`.
* **`lua/local/`**: Diretório para módulos Lua personalizados, permitindo modularizar configurações específicas.
* **`spell/`**: Contém arquivos de dicionário personalizados para correção ortográfica.
* **`lazy-lock.json`**: Arquivo gerado automaticamente pelo gerenciador de plugins Lazy.nvim, utilizado pelo LunarVim para controle de versões dos plugins instalados.

---

## ⚙️ Destaques da Configuração

### Plugins Adicionais

A configuração inclui a adição de plugins personalizados no arquivo `config.lua`, utilizando a tabela `lvim.plugins`. Por exemplo:([Reddit][1])

```lua
lvim.plugins = {
  { "wfxr/minimap.vim" },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  { "arcticicestudio/nord-vim" },
  { "rmehri01/onenord.nvim" },
  { "kassio/neoterm" },
}
```



### Linters e Formatadores

A configuração também permite a adição de linters e formatadores personalizados através do módulo `null-ls`. Por exemplo:([Gist][2])

```lua
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    filetypes = { "javascript", "python" },
  },
}
```



### Autocommands

Autocomandos personalizados podem ser adicionados para ajustar comportamentos específicos, como habilitar quebra de linha para arquivos JSON ou aplicar realces específicos para arquivos Zsh. Exemplo:([Gist][2])

```lua
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})
```



---

## Instalação e Uso

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/ornan-matos/lvim.git ~/.config/lvim
   ```



2. **Instale o LunarVim:**

   Siga as instruções oficiais de instalação no site do [LunarVim](https://www.lunarvim.org/docs/installation).

3. **Sincronize os plugins:**

   Abra o LunarVim e execute:

   ```vim
   :Lazy sync
   ```



---

## 🔎 Considerações Finais

Esta configuração do LunarVim é modular e organizada, facilitando a personalização conforme suas necessidades. A estrutura em módulos Lua permite uma manutenção mais eficiente e a adição de funcionalidades específicas sem comprometer a clareza do arquivo principal de configuração.

O repositório [ornan-matos/lvim](https://github.com/ornan-matos/lvim) contém uma configuração personalizada do LunarVim, organizada para facilitar a manutenção e expansão.

Para mais informações sobre a configuração do LunarVim, consulte a [documentação oficial](https://www.lunarvim.org/docs/configuration).
