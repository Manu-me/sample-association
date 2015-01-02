class Kid < ActiveRecord::Base
	has_many :candies, dependent: :destroy
end
