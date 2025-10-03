return function(luasnip)
  luasnip.add_snippets("java", require("luasnip.snippets.java"))
  luasnip.add_snippets("gitcommit", require("luasnip.snippets.gitcommit"))
  luasnip.add_snippets("markdown", require("luasnip.snippets.markdown"))
  luasnip.add_snippets("sql", require("luasnip.snippets.sql"))
  luasnip.add_snippets("lua", require("luasnip.snippets.lua"))
end
