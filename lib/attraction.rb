class Attraction < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 50}, :uniqueness => true})
  validates(:description, {:presence => true, :length => {:maximum => 200}})
  has_many :attraction_tags
  has_many :tags, through: :attraction_tags
end
