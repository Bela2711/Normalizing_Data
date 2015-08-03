require "csv"
class UploadFile < ActiveRecord::Base
  def self.save(file_data)
    csv = CSV.new(file_data.read,:headers => true,:header_converters => :symbol)
    file_data.rewind
    if csv.to_a[1].to_s.split("\t")[1].nil?
      puts "it is csv"
      parsed_file = CSV.new(file_data.read,:headers => true,:header_converters => :symbol)
    else
      puts "it is tsv"
      parsed_file = CSV.new(file_data.read, :headers => true,:header_converters => :symbol , :col_sep => "\t")
    end
    parsed_file.to_a.map{|row| puts row.to_hash}
  end
end
