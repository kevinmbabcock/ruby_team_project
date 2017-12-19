class Attraction < ActiveRecord::Base
  validates(:name, :presence => true)
  validates(:name, :length => {:maximum => 50})
  # validates(:name, :uniqueness => true)
  validates(:description, :presence => true)
  validates(:description, :length => {:maximum => 200})
  # before_create(:capitalize_name)
  has_many :attraction_tags
  has_many :tags, through: :attraction_tags

  # private
  #
  # def capitalize_name
  #   self.name = self.name.capitalize!
  # end

end
