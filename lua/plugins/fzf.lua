return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      -- Ivy fullscreen lookalike
      winopts = {
        height = 1.0,               -- fullscreen
        width = 1.0,
        row = 0.5,                  -- center vertically
        col = 0.5,
        border = "none",            -- no border
        preview = {
          layout = "vertical",      -- preview on top like your Telescope ivy
          vertical = "up:70%",      -- 70% preview height
          horizontal = "right:60%", -- fallback for wide windows
          title = false,
        },
      },

      -- Visuals & prompt styling
      fzf_opts = {
        ["--layout"] = "reverse",   -- prompt on top
        ["--info"] = "inline",
        ["--ansi"] = "",
        ["--no-separator"] = "",
        ["--padding"] = "1,2",      -- subtle padding
      },

      keymap = {
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
          ["<Esc>"] = "abort",
          ["<C-j>"] = "down",
          ["<C-k>"] = "up",
          ["<C-s>"] = "vsplit",
        },
      },

      -- Icons, prefixes, etc.
      files = {
        prompt = "   ",
        fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude '*.lock' --exclude target]],
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },

      buffers = {
        prompt = "   ",
        sort_lastused = true,
        ignore_current_buffer = true,
        cwd_only = false,
        actions = {
          ["default"] = fzf.actions.file_edit,
          ["ctrl-d"] = { fn = fzf.actions.buf_del, desc = "Delete Buffer" },
        },
      },

      grep = {
        prompt = "   ",
        rg_opts = table.concat({
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        }),
      },

      previewers = {
        bat = {
          theme = "OneHalfDark",
          config = { "--style=numbers,changes", "--color=always" },
        },
      },

      -- Optional telescope preset base for consistent feel
      profile = "telescope",
    })

    -- Keymaps matching your Telescope setup
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Search [G]it [F]iles" })
    vim.keymap.set("n", "<leader>fl", fzf.live_grep, { desc = "[F]ind by [L]ive grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "[F]ind active [B]uffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[F]ind help tags" })
    vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "[F]ind [O]ld files" })
    vim.keymap.set("n", "<leader>f/", fzf.grep_curbuf, { desc = "[/] Fuzzily [F]ind in buffer" })
  end,
}

