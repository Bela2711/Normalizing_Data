require "csv"
class UploadFile < ActiveRecord::Base
  def self.save(upload)
    #puts File.read(upload)
    #data =  String.read(upload['datafile'])
    #data = File.read(upload['datafile'])
    csv = CSV.new(upload.read,:headers => true,:header_converters => :symbol)
    csv.to_a.map{|row| puts row.to_hash}
    
  end
end
