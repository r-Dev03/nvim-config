vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    if vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?" then
      vim.opt.hlsearch = true
    else
      vim.opt.hlsearch = false
    end
  end,
  desc = "Highlighting matched words when searching",
})

-- vim.api.nvim_create_user_command("Grep", "silent grep! <args> | copen | redraw!", { nargs = "+" })
