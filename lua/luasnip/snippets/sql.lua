local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  -- Create tables
  s("createt", { t("CREATE TABLE "), i(1, "tableName"), t({ " (", "\t" }), i(2, "attribute(s)"), t({ "", ");" }) }),
  s(
    "createti",
    { t("CREATE TABLE IF NOT EXISTS "), i(1, "tableName"), t({ " (", "\t" }), i(2, "attribute(s)"), t({ "", ");" }) }
  ),

  -- Create databases
  s("created", { t("CREATE DATABASE "), i(1, "name"), t(";") }),
  s("createdi", { t("CREATE DATABASE IF NOT EXISTS "), i(1, "name"), t(";") }),

  -- Insert
  s("insert", {
    t("INSERT INTO "),
    i(1, "tableName"),
    t({ " (", "\t" }),
    i(2, "attribute(s)"),
    t({ "", ") VALUES ( " }),
    i(3, "values"),
    t({ " )" }),
  }),

  -- Drop tables/databases
  s("dropt", { t("DROP TABLE "), i(1, "tableName"), t(";") }),
  s("dropd", { t("DROP DATABASE "), i(1, "dbName"), t(";") }),
  s("dropti", { t("DROP TABLE IF EXISTS "), i(1, "tableName"), t(";") }),
  s("dropdi", { t("DROP DATABASE IF EXISTS "), i(1, "dbName"), t(";") }),

  -- Show tables/databases
  s("showt", { t("SHOW TABLES;") }),
  s("showd", { t("SHOW DATABASES;") }),

  -- Select
  s("select", { t("SELECT "), i(1, "attribute(s)"), t(" FROM "), i(2, "tableName"), t(";") }),
  s("selectd", { t("SELECT DISTINCT "), i(1, "attribute(s)"), t({ "", "\tFROM " }), i(2, "tableName"), t(";") }),
  s("selectw", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tWHERE " }),
    i(3, "condition"),
    t(";"),
  }),
  s("selector", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tORDER BY " }),
    i(3, "attribute(s)"),
    t(" "),
    i(4, "ASC|DESC"),
    t(";"),
  }),

  -- Update & Delete
  s("updatet", {
    t("UPDATE "),
    i(1, "tableName"),
    t({ "", "\tSET " }),
    i(2, "attribute(s)"),
    t({ "", "\tWHERE " }),
    i(3, "condition"),
    t(";"),
  }),
  s("delete", { t("DELETE FROM "), i(1, "tableName"), t({ "", "\tWHERE " }), i(2, "condition"), t(";") }),

  -- Alter table & database
  s("altert", { t("ALTER TABLE "), i(1, "tableName"), t({ "", "\t " }), i(2, "instructions"), t(";") }),
  s("alterad", { t("ALTER TABLE "), i(1, "tableName"), t({ "", "\tADD COLUMN " }), i(2, "col_name"), t(";") }),
  s("alteraf", {
    t("ALTER TABLE "),
    i(1, "tableName"),
    t({ "", "\tADD COLUMN " }),
    i(2, "col_name"),
    t({ "", "\tAFTER " }),
    i(5, "col_name"),
    t(";"),
  }),
  s("alterdb", {
    t("ALTER DATABASE "),
    i(1, "dbName"),
    t({ "", "\tCHARACTER SET " }),
    i(2, "charset"),
    t({ "", "\tCOLLATE " }),
    i(3, "utf8_unicode_ci"),
    t(";"),
  }),

  -- Joins
  s("ijoin", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tINNER JOIN " }),
    i(3, "tableName2"),
    t({ "", "\tON " }),
    i(4, "match"),
    t(";"),
  }),
  s("rjoin", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tRIGHT JOIN " }),
    i(3, "tableName2"),
    t({ "", "\tON " }),
    i(4, "match"),
    t(";"),
  }),
  s("ljoin", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tLEFT JOIN " }),
    i(3, "tableName2"),
    t({ "", "\tON " }),
    i(4, "match"),
    t(";"),
  }),
  s("fjoin", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tFULL JOIN OUTER " }),
    i(3, "tableName2"),
    t({ "", "\tON " }),
    i(4, "match"),
    t({ "", "\tWHERE " }),
    i(5, "condition"),
    t(";"),
  }),

  -- Union
  s("union", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t(" FROM "),
    i(2, "tableName"),
    t({ "", "UNION" }),
    t({ "", "SELECT " }),
    i(3, "attribute(s)"),
    t(" FROM "),
    i(4, "tableName2"),
    t(";"),
  }),
  s("uniona", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t(" FROM "),
    i(2, "tableName"),
    t({ "", "UNION ALL" }),
    t({ "", "SELECT " }),
    i(3, "attribute(s)"),
    t(" FROM "),
    i(4, "tableName2"),
    t(";"),
  }),

  -- Group By
  s("groupb", {
    t("SELECT "),
    i(1, "attribute(s)"),
    t({ "", "\tFROM " }),
    i(2, "tableName"),
    t({ "", "\tGROUP BY " }),
    i(3, "attribute(s)"),
    t(";"),
  }),

  -- Backup
  s("bakupd", { t("BACKUP DATABASE "), i(1, "dbName"), t({ "", "\tTO DISK " }), i(2, "filepath"), t(";") }),
  s("bakupdw", {
    t("BACKUP DATABASE "),
    i(1, "dbName"),
    t({ "", "\tTO DISK " }),
    i(2, "filepath"),
    t({ "", "\tWITH " }),
    i(3, "DIFERENTIAL"),
    t(";"),
  }),

  -- Keys
  s("primaryk", { t("PRIMARY KEY("), i(1, "attribute"), t(")") }),
  s("primarykc", { t("CONSTRAINT "), i(1, "attribute"), t(" PRIMARY KEY("), i(2, "attribute(s)"), t(")") }),
  s(
    "foreignk",
    { t("FOREIGN KEY("), i(1, "attribute"), t(") REFERENCES "), i(2, "tableName"), t("("), i(3, "attribute"), t(")") }
  ),
  s("foreignkc", {
    t("CONSTRAINT "),
    i(1, "attribute"),
    t(" FOREIGN KEY ("),
    i(2, "attribute(s)"),
    t(")"),
    t({ "", "\tREFERENCES " }),
    i(3, "tableName"),
    t("("),
    i(4, "attribute"),
    t(")"),
  }),
  s("check", { t("CHECK ( "), i(1, "condition"), t(" )") }),

  -- Users
  s(
    "createuser",
    {
      t("CREATE USER '"),
      i(1, "username"),
      t("'@'"),
      i(2, "localhost"),
      t("' IDENTIFIED BY '"),
      i(3, "password"),
      t("';"),
    }
  ),
  s("deleteuser", { t("DELETE FROM mysql.user WHERE user = '"), i(1, "userName"), t("';") }),
  s("grantuser", {
    t("GRANT ALL PRIVILEGES ON "),
    i(1, "db"),
    t("."),
    i(2, "tb"),
    t(" TO '"),
    i(3, "user_name"),
    t("'@'"),
    i(4, "localhost"),
    t("';"),
  }),
}
