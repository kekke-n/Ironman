class Extend::Base < ApplicationRecord
  self.abstract_class = true
  establish_connection :extend_db

  def self.execute_sql sql
    begin
      result = connection.select_all(sql)
    rescue ActiveRecord::StatementInvalid => e
      reg_pattern = /PG::(.*):\sERROR:\s(.*)/
      err_type = e.message[reg_pattern, 1]
      err_msg = e.message[reg_pattern, 2]
      debugger
      case err_type
        when "UndefinedColumn"
          raise "カラム名が定義されていません."
        when "UndefinedTable"
          raise "テーブル名が正しくありません."
        when "SyntaxError"
          raise "SQLの構文に誤りがあります.\n(#{err_msg})"
        else
          raise "SQLの構文に誤りがあります.\n(#{err_msg})"
      end
    rescue => e
      raise e.message
    end
    return result
  end

  def self.is_insert_or_update_sql sql
    return sql.match(/\bupdate\b|\binsert\b/).present?
  end

end
