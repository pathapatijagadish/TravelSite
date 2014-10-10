class Package < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name, use: [:slugged,:finders]
	
	has_many :package_types, dependent: :destroy

	validates :name,:destination , presence: true
	validates :name,length: { in: 4..20 }
end
