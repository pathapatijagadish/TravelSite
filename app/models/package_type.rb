class PackageType < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :transport, use: [:slugged,:finders]
	
	has_many :images, as: :imageable,dependent: :destroy
	belongs_to :package
	accepts_nested_attributes_for :images

	validates :price,:transport, presence: true
end
