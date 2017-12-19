class Tag < ActiveRecord::Base
  validates(:name, {:presence => true})
  validates(:name, :uniqueness => true)
  validates(:name, :length => {:maximum => 25})
  before_save(:lower_case)
  has_many :attraction_tags
  has_many :attractions, through: :attraction_tags

  private

  def lower_case
    self.name = self.name.downcase
  end

end
