class Tag < ActiveRecord::Base
  has_many :attraction_tags
  has_many :attractions, through: :attraction_tags
end
