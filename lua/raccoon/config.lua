local M = {}
M.version = "0.0.1"

---@class raccoon.Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: raccoon.Highlights, colors: ColorScheme)
M.defaults = {
	style = "night",
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	dim_inactive = false,
	lualine_bold = false,

	---@param colors ColorScheme
	on_colors = function(colors) end,
	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights raccoon.Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors) end,

	cache = true, -- When set to true, the theme will be cached for better performance

	---@type table<string, boolean|{enabled:boolean}>
	plugins = {
		-- enable all plugins when not using lazy.nvim
		-- set to false to manually enable/disable plugins
		all = package.loaded.lazy == nil,
		-- uses your plugin manager to automatically enable needed plugins
		-- currently only lazy.nvim is supported
		auto = true,
		-- add any plugins here that you want to enable
		-- for all possible plugins, see:
		--   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
		-- telescope = true,
	},
}

---@type raccoon.Config
M.options = nil

---@param options? raccoon.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? raccoon.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M

-- -- old defaults in init
-- M.defaults = {
-- 	mask = "night",
-- 	background = {
-- 		light = "night",
-- 		dark = "night",
-- 	},
-- 	compile_path = vim.fn.stdpath("cache") .. "/raccoon",
-- 	term_colors = false,
-- 	styles = {
-- 		comments = { italic = true },
-- 		conditionals = { italic = true },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 		-- Background styles. "dark" | "normal"
-- 		sidebars = "dark",
-- 		floats = "dark",
-- 	},
-- 	default_integrations = true,
-- 	masks = { night = 1 },
-- 	path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
-- }

-- -- old config
-- local config = {
-- 	defaults = {
-- 		theme = "dark",
-- 		transparent = false,
-- 		italics = {
-- 			comments = true,
-- 			keywords = true,
-- 			functions = true,
-- 			strings = true,
-- 			variables = true,
-- 			bufferline = false,
-- 		},
-- 		overrides = {},
-- 	},
-- }
--
-- setmetatable(config, { __index = config.defaults })
--
-- print("Inside config.lua: ", config.theme)
--
-- return config
