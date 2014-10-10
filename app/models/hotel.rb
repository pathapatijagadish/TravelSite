class Hotel < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name, use: [:slugged,:finders]
  	
	has_many :images, as: :imageable,dependent: :destroy
	accepts_nested_attributes_for :images

	validates :name,:address , presence: true
	validates :name,length: { in: 3..20 }
end
