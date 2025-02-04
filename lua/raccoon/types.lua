---@class raccoon.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias raccoon.Highlights table<string,raccoon.Highlight|string>

---@alias raccoon.HighlightsFn fun(colors: ColorScheme, opts:raccoon.Config):raccoon.Highlights

---@class raccoon.Cache
---@field groups raccoon.Highlights
---@field inputs table

-- OLD STUFF BELOW

---@class Raccoon
---@field options RaccoonOptions
---@field setup fun(opts: RaccoonOptions?)

---@alias CoonMask "night" | "auto"
---@alias CoonColor "void" | "night" | "base" | "surface0" | "surface1" | "surface2" | "overlay0" | "overlay1" | "moonfur" | "subtext1" | "subtext0" | "text" | "red" | "light_red" | "ember" | "green" | "light_green" | "pine" | "blue" | "light_blue" | "nocturne" | "yellow" | "honey" | "orange" | "bandit" | "purple" | "twilight" | "none"
---@class CoonMasks<T>: {all: T, night: T}
---@class CoonColors<T>: {void: T,night: T,base: T,surface0: T,surface1: T,surface2: T,overlay0: T,overlay1: T,moonfur: T,subtext1: T,subtext0: T,text: T,red: T,light_red: T,ember: T,green: T,light_green: T,pine: T,blue: T,light_blue: T,nocturne: T,yellow: T,honey: T,orange: T,bandit: T,purple: T,twilight: T,none: T}

---@class RaccoonOptions
-- Changes Mask based on the background. See `:h background` for more info.
---@field background CoonBackground?
---@field compile_path string?
---@field term_colors boolean?
-- Default Mask to use on startup.
---@field mask CoonMask?
---@field styles CoonStyles?
---@field default_integrations boolean?

---@class CoonBackground
-- Raccoon Mask to use when `:set background=dark` is set.
---@field dark CoonMask?
-- Raccoon Mask to use when `:set background=dark` is set.
---@field light CoonMask?

---@class CoonStyles
-- Change the style of comments.
---@field comments CoonHighlightArgs[]?
-- Change the style of conditionals.
---@field conditionals CoonHighlightArgs[]?
-- Change the style of loops.
---@field loops CoonHighlightArgs[]?
-- Change the style of functions.
---@field functions CoonHighlightArgs[]?
-- Change the style of keywords.
---@field keywords CoonHighlightArgs[]?
-- Change the style of strings.
---@field strings CoonHighlightArgs[]?
-- Change the style of variables.
---@field variables CoonHighlightArgs[]?
-- Change the style of numbers.
---@field numbers CoonHighlightArgs[]?
-- Change the style of booleans.
---@field booleans CoonHighlightArgs[]?
-- Change the style of properties.
---@field properties CoonHighlightArgs[]?
-- Change the style of types.
---@field types CoonHighlightArgs[]?
-- Change the style of operators.
---@field operators CoonHighlightArgs[]?
-- Change the style of miscs.
---@field miscs CoonHighlightArgs[]?

---@class CoonNativeLspStyles
-- Change the style of LSP error diagnostics.
---@field errors CoonHighlightArgs[]?
-- Change the style of LSP hint diagnostics.
---@field hints CoonHighlightArgs[]?
-- Change the style of LSP warning diagnostics.
---@field warnings CoonHighlightArgs[]?
-- Change the style of LSP information diagnostics.
---@field information CoonHighlightArgs[]?
-- Change the style of LSP ok diagnostics.
---@field ok CoonHighlightArgs[]?

---@class CoonNativeLspInlayHints
-- Toggle the background of inlay hints.
---@field background boolean?

---@alias CoonHighlightArgs "bold" | "underline" | "undercurl" | "underdouble" | "underdotted" | "underdashed" | "strikethrough" | "reverse" | "inverse" | "italic" | "standout" | "altfont" | "nocombine" | "NONE"
---@alias CoonHighlightOverrideFn fun(colors: CoonColors<string>): { [string]: CoonHighlight}
---@alias CoonHighlightOverrides CoonMasks<CoonHighlightOverrideFn>

---@class CoonHighlight
---@field fg string?
---@field bg string?
---@field style CoonHighlightArgs[]?
---@field link string?
