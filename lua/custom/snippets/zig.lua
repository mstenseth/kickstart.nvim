local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Debug print snippet
  s("pr", {
    t('std.debug.print("'), i(1, "message"), t('\\n", .{'), i(2), t("});")
  }),
  
  -- Print variable under cursor
  s("pv", {
    t('std.debug.print("'), 
    f(function() return vim.fn.expand("<cword>") end),
    t(' = {}\\n", .{'),
    f(function() return vim.fn.expand("<cword>") end),
    t("});")
  }),
  
  -- Function snippet
  s("fn", {
    t("fn "), i(1, "name"), t("("), i(2), t(") "), i(3, "void"), t(" {"),
    t({"", "    "}), i(4, "// body"),
    t({"", "}"})
  }),
  
  -- Test snippet
  s("test", {
    t("test \""), i(1, "test name"), t("\" {"),
    t({"", "    "}), i(2, "// test body"),
    t({"", "}"})
  }),
}