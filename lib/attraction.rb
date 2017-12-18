class Attraction < ActiveRecord::Base
  validates(:name, :presence => true)
  has_many :attraction_tags
  has_many :tags, through: :attraction_tags
end
