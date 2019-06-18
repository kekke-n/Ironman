class Extend::Base < ApplicationRecord
  self.abstract_class = true
  establish_connection :extend_db

  def self.execute_sql sql
    begin
      result = connection.select_all(sql)
    rescue => e
      raise e.message
    end
    return result
  end

  def self.is_insert_or_update_sql sql
    return sql.match(/\bupdate\b|\binsert\b/).present?
  end

end
