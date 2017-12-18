class Tag < ActiveRecord::Base
  validates(:name, :presence => true)
  has_many :attraction_tags
  has_many :attractions, through: :attraction_tags
end
