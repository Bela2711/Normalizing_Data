class Merchant < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :items, through: :items_merchant
end
