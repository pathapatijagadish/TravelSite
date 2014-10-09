class Blog < ActiveRecord::Base
	has_many :images, as: :imageable,dependent: :destroy
	has_many :comments,dependent: :destroy
	accepts_nested_attributes_for :images
end
