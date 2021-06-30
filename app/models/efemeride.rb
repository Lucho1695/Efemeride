class Efemeride < ApplicationRecord
  has_one :category
  has_many :image_files

  accepts_nested_attributes_for :image_files,
  allow_destroy: true, reject_if: lambda { |a| a[:image_file].blank? }

end
