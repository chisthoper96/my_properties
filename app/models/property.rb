class Property < ApplicationRecord
  # relations
  belongs_to :user

  # validations
  validates :price, numericality: { greater_than: 0 }
  validates :operation, :property_type, :currency_type, :commune, presence: true
  
  # enum
  enum operation: [:VENTA, :ARRIENDO]
  enum property_type: [:CASA, :DEPTO, :OFICINA, :TERRENO]
  enum currency_type: [:CLP, :UF]

end
