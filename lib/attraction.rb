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
      end
      seasons.each do |season|
        if new_seasons.include?(season)
          #do nothing
        else
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
      new_tag_ids = self.tag_ids
      tag_ids.each do |id|
        new_tag_ids.push(id.to_i)
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
        remove_tag_ids.include?(id.to_s)
      end
    end
    self.update({:name => new_name, :description => new_description, :season => new_seasons, :price => new_price, :tag_ids => new_tag_ids})
  end

  def self.search_results(tag_ids, seasons, minimum, maximum)
    all_attractions = Attraction.all
    attractions = []
    if tag_ids
      tag_ids.each do |id|
        tag = Tag.find(id)
        new_attractions = tag.attractions
        new_attractions.each do |attraction|
          attractions.push(attraction)
        end
      end
    end
    if seasons
      all_attractions.each do |attraction|
        if attraction.season
          seasons.each do |each_season|
            if attraction.season.include?(each_season)
              if attractions.include?(attraction)
                #do nothing
              else
                attractions.push(attraction)
              end
            end
          end
        end
      end
    end
    if maximum == 0.0 && minimum == 0.0
      #do nothing
    elsif minimum > 0.0 && maximum != 0.0 #if user fills in both maximum and minimum values
      all_attractions.each do |attraction|
        if attraction.price
          if attraction.price > minimum && attraction.price < maximum
            if attractions.include?(attraction)
              #do nothing
            else
              attractions.push(attraction)
            end
          end
        end
      end
    elsif minimum > 0.0 && maximum == 0.0 #if user only fills in minimum value
      all_attractions.each do |attraction|
        if attraction.price
          if attraction.price > minimum
            if attractions.include?(attraction)
              #do nothing
            else
              attractions.push(attraction)
            end
          end
        end
      end
    elsif minimum == 0.0 && maximum > 0.0 #if user only fills in maximum value
      all_attractions.each do |attraction|
        if attraction.price
          if attraction.price < maximum
            if attractions.include?(attraction)
              #do nothing
            else
              attractions.push(attraction)
            end
          end
        end
      end
    end
    attractions
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
