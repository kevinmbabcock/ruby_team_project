require 'spec_helper'

describe 'Attraction' do
  it 'has many tags' do
    test_tag1 = Tag.create({:name => "tag1"})
    test_tag2 = Tag.create({:name => "tag2"})
    test_attraction = Attraction.create({:name => "Space Needle", :description => "none", :price => nil, :season => "Spring", :tag_ids => [test_tag1.id, test_tag2.id]})
    expect(test_attraction.tags).to(eq([test_tag1, test_tag2]))
  end

  it 'validates the presence of a name' do
    attraction = Attraction.new({:name => "", :description => "none"})
    expect(attraction.save).to(eq(false))
  end

  it 'validates the length of the name' do
    attraction = Attraction.new({:name => "a"*51, :description => "none"})
    expect(attraction.save).to(eq(false))
  end

  it 'validates that the name of the Attraction is unique' do
    attraction1 = Attraction.create({:name => "field", :description => "none"})
    attraction2 = Attraction.create({:name => "field", :description => "not available"})
    expect(attraction2.save).to(eq(false))
  end

  it 'validates the presence of a description' do
    attraction = Attraction.new({:name => "name", :description => ""})
    expect(attraction.save).to(eq(false))
  end

  it 'validates the length of a description' do
    attraction = Attraction.new({:name => "name", :description => "a"*201})
    expect(attraction.save).to(eq(false))
  end

  describe '#capitalize_name' do
    it 'capitalizes the name of the attraction' do
      attraction = Attraction.create({:name => "waterfront", :description => "none"})
      expect(attraction.name).to(eq("Waterfront"))
    end
  end

  describe '#custom_update' do
    it 'keeps all information before update and adds new info' do
      attraction1 = Attraction.create({:name => "waterfront", :description => "none", :season => ["winter", "summer"], :price => 40, :tag_ids => []})
      attraction2 = Attraction.create({:name => "market", :description => "something", :season => ["summer", "spring"], :price => 50, :tag_ids => []})
      attraction1.custom_update("market", "something", ["spring"], 50, nil, ["winter"], nil)
      expect(attraction1.name).to(eq(attraction2.name))
      expect(attraction1.description).to(eq(attraction2.description))
      expect(attraction1.season).to(eq(attraction2.season))
      expect(attraction1.price).to(eq(attraction2.price))
      expect(attraction1.tag_ids).to(eq(attraction2.tag_ids))
    end
  end

  describe '#search_results' do
    it 'returns all attractions matching the search criteria' do
      tag1 = Tag.create({:name => "tag1"})
      tag2 = Tag.create({:name => "tag2"})
      tag3 = Tag.create({:name => "tag3"})
      binding.pry
      attraction1 = Attraction.create({:name => "waterfront", :description => "something", :season => ["Summer"], :price => 45, :tag_ids => [tag1.id]})
      attraction2 = Attraction.create({:name => "market", :description => "something else", :season => ["Spring"], :price => 5, :tag_ids => [tag2.id]})
      expect(Attraction.search_results(nil, ["Summer"], nil, nil)).to(eq([attraction1]))
      expect(Attraction.search_results(nil, nil, 0, nil)).to(eq([attraction1, attraction2]))
      expect(Attraction.search_results(nil, nil, 4, 40)).to(eq([attraction2]))
      expect(Attraction.search_results(nil, nil, 4, 6)).to(eq([attraction2]))
      expect(Attraction.search_results(nil, ["Summer"], 0, 40)).to(eq([attraction1, attraction2]))
      expect(Attraction.search_results([tag1.id], nil, nil, nil)).to(eq([attraction1]))
    end
  end

end
