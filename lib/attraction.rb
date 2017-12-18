class Attraction < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 50}, :uniqueness => true})
  validates(:description, {:presence => true, :length => {:maximum => 200}})
  before_save(:capitalize_name)
  has_many :attraction_tags
  has_many :tags, through: :attraction_tags

  private

  def capitalize_name
    self.name = self.name.capitalize!
  end

end
