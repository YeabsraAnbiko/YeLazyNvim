local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  -- Require module
  s("req", { t("require("), i(1, "module"), t(")") }),
  s("rt", { t("return "), i(0) }),
  s("ll", { t("local "), i(1, "varName"), t(" = "), i(0, "value") }),
  s("l", { t("local "), i(0) }),
  s("lreq", { t("local "), i(1, "module"), t(' = require("'), i(2, "$1"), t('")'), i(0) }),

  -- Class
  s("cl", {
    i(1, "M"),
    t(" = {}"),
    t({ "", "" }),
    t({ "" }),
    i(1, "M"),
    t("."),
    i(2, "new"),
    t(" = function("),
    i(3),
    t({ ")" }),
    t({ "", "\t" }),
    i(6),
    t({ "", "end" }),
  }),

  -- If / elseif
  s("if", { t("if "), i(1, "true"), t(" then"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("elseif", { t("elseif "), i(1, "true"), t(" then"), t({ "", "\t" }), i(0) }),

  -- Loops
  s("for", { t("for "), i(1), t(" do"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("forn", {
    t("for "),
    i(1, "i"),
    t(" = "),
    i(2, "1"),
    t(", "),
    i(3, "10"),
    t(" do"),
    t({ "", "\t" }),
    i(0),
    t({ "", "end" }),
  }),
  s("fori", {
    t("for "),
    i(1, "i"),
    t(", "),
    i(2, "x"),
    t(" in ipairs("),
    i(3, "t"),
    t(") do"),
    t({ "", "\t" }),
    i(0),
    t({
      "",
      "end",
    }),
  }),
  s("forp", {
    t("for "),
    i(1, "k"),
    t(", "),
    i(2, "v"),
    t(" in pairs("),
    i(3, "t"),
    t(") do"),
    t({ "", "\t" }),
    i(0),
    t({
      "",
      "end",
    }),
  }),
  s("forline", {
    t("local f = io.open("),
    i(1, "filename"),
    t(', "'),
    i(3, "r"),
    t('")'),
    t({ "", "while true do" }),
    t({ "", "\tline = f:read()" }),
    t({ "", "\tif line == nil then break end" }),
    t({ "", "\t" }),
    i(0),
    t({ "", "end" }),
  }),

  -- Functions
  s("fu", { t("function "), i(1, "name"), t("("), i(2), t(")"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("f=", { i(1, "name"), t(" = function("), i(2), t(")"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("lfu", { t("local function "), i(1, "name"), t("("), i(2), t(")"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("lf=", { t("local "), i(1, "name"), t(" = function("), i(2), t(")"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("f)", { t("function("), i(1), t(")"), t({ "", "\t" }), i(0), t({ "", "end" }) }),
  s("f,", { i(1, "name"), t(" = function("), i(2), t(")"), t({ "", "\t" }), i(0), t({ "", "end," }) }),

  -- Print / self
  s("p", { t("print("), i(0), t(")") }),
  s(
    "self:",
    { t("function self:"), i(1, "methodName"), t("("), i(2), t(")"), t({ "", "\t" }), i(0), t({ "", "end" }) }
  ),

  -- While
  s("while", { t("while "), i(1, "true"), t(" do"), t({ "", "\t" }), i(0), t({ "", "end" }) }),

  -- Pcall
  s("pca", { t("pcall("), i(1, "function"), t(")") }),
  s("lpca", { t("local "), i(1, "status"), t(", "), i(2, "err_or_value"), t(" = pcall("), i(3, "function"), t(")") }),
}
