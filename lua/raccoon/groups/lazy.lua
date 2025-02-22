local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type raccoon.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    LazyProgressDone = { bold = true, fg = c.magenta2 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }
end

return M
