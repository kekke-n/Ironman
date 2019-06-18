require 'spec_helper'

RSpec.describe Extend::Base do
  describe '#self.execute_sql sql' do
  end

  describe '#self.is_insert_or_update_sql sql' do
    let(:select_sql) { "select * from table where id = 1" }
    let(:update_sql) { "update table set column=0 where id = 1" }
    let(:insert_sql) { "insert into table (column) values (1)" }
    it "select_sql is true" do
      expect(Extend::Base.is_insert_or_update_sql(select_sql)).to eq true
    end
  end
end
