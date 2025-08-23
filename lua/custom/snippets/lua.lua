local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Simple function snippet
  s("fn", {
    t("function "), i(1, "name"), t("("), i(2), t(")"),
    t({"", "  "}), i(3, "-- body"),
    t({"", "end"})
  }),
  
  -- Print snippet
  s("pr", {
    t("print('"), i(1, "message"), t("')")
  }),
  
  -- Local variable assignment
  s("loc", {
    t("local "), i(1, "var"), t(" = "), i(2, "value")
  }),
}