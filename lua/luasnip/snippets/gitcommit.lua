local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("cc", {
    i(1, "type"),
    t("("),
    i(2, "scope"),
    t("): "),
    i(3, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("fix", {
    t("fix("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("feat", {
    t("feat("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("build", {
    t("build("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("chore", {
    t("chore("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("ci", {
    t("ci("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("docs", {
    t("docs("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("style", {
    t("style("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("refactor", {
    t("refactor("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("perf", {
    t("perf("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("test", {
    t("test("),
    i(1, "scope"),
    t("): "),
    i(2, "title"),
    t({ "", "" }),
    i(0),
  }),

  s("BREAK", {
    t("BREAKING CHANGE: "),
    i(0),
  }),

  s("co", {
    t("Co-authored-by: "),
    i(1, "name"),
    t(" <"),
    i(2, "email"),
    t(">"),
    t({ "", "" }),
    i(0),
  }),

  s("si", {
    t("Signed-off-by: "),
    i(1, "name"),
    t(" <"),
    i(2, "email"),
    t(">"),
    t({ "", "" }),
    i(0),
  }),

  s("on", {
    t("On-behalf-of: "),
    i(1, "org"),
    t(" <"),
    i(2, "email"),
    t(">"),
    t({ "", "" }),
    i(0),
  }),
}
