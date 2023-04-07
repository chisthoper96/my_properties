class Property < ApplicationRecord
  # relations
  belongs_to :user

  # validations
  validates :price, numericality: { greater_than: 0 }
  validates :operation, :property_type, :currency_type, :commune, presence: true
  validate :validate_images
  
  # enum
  enum operation: [:VENTA, :ARRIENDO]
  enum property_type: [:CASA, :DEPTO, :OFICINA, :TERRENO]
  enum currency_type: [:CLP, :UF]

  # activestorage
  has_many_attached :images

  private 

  def validate_images
    unless images.attached? && images.length >= 3
      errors.add(:images, "Debe ingresar un min de 3 imagenes")
    end
  end
  
end
