require "csv"
class UploadFile
  def self.save(file_data,user_id)
    csv = CSV.new(file_data.read,:headers => true,:header_converters => :symbol)
    file_data.rewind
    if csv.to_a[1].to_s.split("\t")[1].nil?
      puts "it is csv"
      parsed_file = CSV.new(file_data.read,:headers => true,:header_converters => :symbol)
    else
      puts "it is tsv"
      parsed_file = CSV.new(file_data.read, :headers => true,:header_converters => :symbol , :col_sep => "\t")
    end
    parsed_file.to_a.map{|row| 
       hashed_data = row.to_hash
puts hashed_data
       purchaser = Purchaser.create(name: hashed_data[:purchaser_name])
       merchant = Merchant.create(name: hashed_data[:merchant_name],address: hashed_data[:merchant_address])
       item = Item.create(description: hashed_data[:item_description])
puts "here yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
order = Order.create(purchaser_id: purchaser.id, item_id: item.id, count: hashed_data[:purchase_count].to_i, user_id: user_id.to_i)
item_merchant = ItemsMerchant.create(item_id: item.id,merchant_id:merchant.id)
    }
  end
end
