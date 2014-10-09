class PackageType < ActiveRecord::Base
	has_many :images, as: :imageable,dependent: :destroy
	belongs_to :package
	accepts_nested_attributes_for :images
end
