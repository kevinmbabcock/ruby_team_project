class Attraction < ActiveRecord::Base
  has_many :attraction_tags
  has_many :tags, through: :attraction_tags
end
