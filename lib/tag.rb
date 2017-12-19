class Tag < ActiveRecord::Base
  validates(:name, {:presence => true, :uniqueness => true, :length => {:maximum => 25}})

  has_many :attraction_tags
  has_many :attractions, through: :attraction_tags


end
