lvim.plugins = {

-- Theme Bluloco (Light)
{
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    -- your optional config goes here, see below.
  end,
},

{
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup()
  end
},

{
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
},
-- 

}
