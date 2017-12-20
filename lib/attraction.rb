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

  def custom_update(name, description, seasons, price, tag_ids, remove_seasons, remove_tag_ids)
    binding.pry
    if name != ""
      new_name = name
    else
      new_name = self.name
    end
    if description != ""
      new_description = description
    else
      new_description = self.description
    end
    if seasons
      if self.season
        new_seasons = self.season
      else
        new_seasons = []
        seasons.each do |season|
          new_seasons.push(season)
        end
      end
    else
      new_seasons = self.season
    end
    if price != ""
      new_price = price.to_f
    else
      new_price = self.price
    end
    if tag_ids
      if self.tag_ids
        new_tag_ids = self.tag_ids
      else
        new_tag_ids = []
        tag_ids.each do |id|
          self.tag_ids.push(id)
        end
      end
    else
      new_tag_ids = self.tag_ids
    end
    if remove_seasons
      new_seasons.delete_if do |season|
        remove_seasons.include?(season)
      end
    end
    if remove_tag_ids
      new_tag_ids.delete_if do |id|
        remove_tag_ids.include?(id)
      end
    end


    self.update({:name => new_name, :description => new_description, :season => new_seasons, :price => new_price, :tag_ids => new_tag_ids})
  end

  private

  def capitalize_name
    new_name = ""
    names = self.name.downcase.split
    names.each do |name|
      new_name.concat(name.capitalize + " ")
    end
    self.name = new_name.chop
  end

end
