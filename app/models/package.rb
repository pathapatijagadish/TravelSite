class Package < ActiveRecord::Base
	has_many :package_types, dependent: :destroy
end
