class Blog < ActiveRecord::Base
	#def to_param
    #	"#{id} #{name}".parameterize
  	#end

	extend FriendlyId
  	friendly_id :name, use: [:slugged,:finders]
  	
	has_many :images, as: :imageable,dependent: :destroy
	has_many :comments,dependent: :destroy
	accepts_nested_attributes_for :images

	validates :name,:description , presence: true
	validates :name,length: { in: 3..20 }
end
