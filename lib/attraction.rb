class Attraction < ActiveRecord::Base
  validates(:name, :presence => true)
  validates(:name, :length => {:maximum => 50})
  validates(:name, :uniqueness => true)
  validates(:description, :presence => true)
  validates(:description, :length => {:maximum => 200})
  before_save(:capitalize_name)
  before_update(:capitalize_name)
  has_many :attraction_tags
  has_many :tags, through: :attraction_tags

  def custom_update(name, description, seasons, price, tag_ids)
    if name
      new_name = name
    else
      new_name = self.name
    end
    if description
      new_description = description
    else
      new_description = self.description
    end
    if seasons
      new_seasons = self.season
      seasons.each do |season|
        new_seasons.push(season)
      end
    else
      new_seasons = self.season
    end
    if price
      new_price = price
    else
      new_price = self.price
    end
    if tag_ids
      new_tag_ids = self.tag_ids
      tag_ids.each do |id|
        self.tag_ids.push(id)
      end
    else
      new_tag_ids = self.tag_ids
    end
    self.update({:name => new_name, :description => new_description, :season => new_seasons, :price => new_price, :tag_ids => new_tag_ids})
  end

  private

  def capitalize_name
    self.name = self.name.capitalize
  end



end
