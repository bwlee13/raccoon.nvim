local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type raccoon.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    BufferLineIndicatorSelected = {fg = c.blue6 },
    BufferLineFill = {bg = c.bg_dark},
  }
end

return M
