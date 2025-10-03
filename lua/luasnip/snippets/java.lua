local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("main", {
    t("public static void main(String[] args) {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("class", {
    t("public class "),
    i(1, "ClassName"),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("sysout", {
    t("System.out.println("),
    i(0),
    t(");"),
  }),

  s("syserr", {
    t("System.err.println("),
    i(0),
    t(");"),
  }),

  s("fori", {
    t("for ("),
    i(1, "int"),
    t(" "),
    i(2, "i"),
    t(" = "),
    i(3, "0"),
    t("; "),
    i(2),
    t(" < "),
    i(4, "max"),
    t("; "),
    i(2),
    t("++) {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("foreach", {
    t("for ("),
    i(1, "type"),
    t(" "),
    i(2, "var"),
    t(" : "),
    i(3, "iterable"),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("ctor", {
    t("public "),
    i(1, "ClassName"),
    t("("),
    i(2),
    t(") {"),
    t({ "", "\t" }),
    i(0, "super();"),
    t({ "", "}" }),
  }),

  s("if", {
    t("if ("),
    i(1, "condition"),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("ifelse", {
    t("if ("),
    i(1, "condition"),
    t(") {"),
    t({ "", "\t" }),
    i(2),
    t({ "", "} else {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("ifnull", {
    t("if ("),
    i(1, "condition"),
    t(" == null) {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("ifnotnull", {
    t("if ("),
    i(1, "condition"),
    t(" != null) {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("try_catch", {
    t("try {"),
    t({ "", "\t" }),
    i(1),
    t({ "", "} catch (" }),
    i(2, "Exception"),
    t(" "),
    i(3, "e"),
    t(") {"),
    t({ "", "\t" }),
    i(4),
    t("//TODO: handle exception"),
    t({ "", "}" }),
  }),

  s("try_resources", {
    t("try ("),
    i(1),
    t(") {"),
    t({ "", "\t" }),
    i(2),
    t({ "", "} catch (" }),
    i(3, "Exception"),
    t(" "),
    i(4, "e"),
    t(") {"),
    t({ "", "\t" }),
    i(5),
    t("//TODO: handle exception"),
    t({ "", "}" }),
  }),

  s("private_method", {
    t("private "),
    i(1, "void"),
    t(" "),
    i(2, "name"),
    t("("),
    i(3),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("public_method", {
    t("public "),
    i(1, "void"),
    t(" "),
    i(2, "name"),
    t("("),
    i(3),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("private_static_method", {
    t("private static "),
    i(1, "Type"),
    t(" "),
    i(2, "name"),
    t("("),
    i(3),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("public_static_method", {
    t("public static "),
    i(1, "void"),
    t(" "),
    i(2, "name"),
    t("("),
    i(3),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("protected_method", {
    t("protected "),
    i(1, "void"),
    t(" "),
    i(2, "name"),
    t("("),
    i(3),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("switch", {
    t("switch ("),
    i(1, "key"),
    t(") {"),
    t({ "", "\tcase " }),
    i(2, "value"),
    t(":"),
    t({ "", "\t\t" }),
    i(0),
    t({ "", "\t\tbreak;", "", "\tdefault:", "\t\tbreak;", "}" }),
  }),

  s("while", {
    t("while ("),
    i(1, "condition"),
    t(") {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("dowhile", {
    t("do {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "} while (" }),
    i(1, "condition"),
    t(");"),
  }),

  s("new", {
    i(1, "Object"),
    t(" "),
    i(2, "foo"),
    t(" = new "),
    i(1),
    t("();"),
  }),

  s("public_field", {
    t("public "),
    i(1, "String"),
    t(" "),
    i(2, "name"),
    t(";"),
  }),

  s("private_field", {
    t("private "),
    i(1, "String"),
    t(" "),
    i(2, "name"),
    t(";"),
  }),

  s("protected_field", {
    t("protected "),
    i(1, "String"),
    t(" "),
    i(2, "name"),
    t(";"),
  }),

  s("package", {
    t("package "),
    i(1, "PackageName"),
  }),

  s("import", {
    t("import "),
    i(1, "PackageName"),
  }),
}
