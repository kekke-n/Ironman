class OutputFileService

  def self.get_csv_data input_data, has_header=false
    csv_data = CSV.generate("", :headers => input_data.columns, :write_headers => has_header) do |csv|
      input_data.each_with_index do |record, index|
        next if index == 1
        csv << record
      end
    end
    return csv_data
  end
  def self.get_tsv_data input_data, has_header=false
    tsv_data = CSV.generate("", :headers => input_data.columns, :write_headers => has_header, :col_sep => "\t") do |tsv|
      input_data.each_with_index do |record, index|
        next if index == 1
        tsv << record
      end
    end
    return tsv_data
  end
end
