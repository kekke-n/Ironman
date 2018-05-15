class DbConnectService

  def self.execute_sql sql
    begin
      ActiveRecord::Base.establish_connection :extend_db
      con = ActiveRecord::Base.connection
      result = con.select_all(sql)
      ActiveRecord::Base.establish_connection :development
    rescue
      ActiveRecord::Base.establish_connection :development
    end
    return result
  end

  def self.is_insert_or_update_sql sql
    return sql.match(/\bupdate\b|\binsert\b/).present?
  end

end
