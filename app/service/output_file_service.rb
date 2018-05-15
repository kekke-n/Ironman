class OutputFileService

  def self.generate_csv_from_active_record input_data, has_header=false
    CSV.generate("", :headers => input_data.columns, :write_headers => has_header) do |csv|
      input_data.each_with_index do |record, index|
        next if index == 1
        csv << record
      end
    end
  end
  def self.generate_tsv_from_active_record input_data, has_header=false
    CSV.generate("", :headers => input_data.columns, :write_headers => has_header, :col_sep => "\t") do |csv|
      input_data.each_with_index do |record, index|
        next if index == 1
        csv << record
      end
    end
  end
end
