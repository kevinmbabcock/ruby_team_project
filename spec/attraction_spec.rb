require 'spec_helper'

describe 'Attraction' do
  it 'has many tags' do
    test_tag1 = Tag.create({:name => "tag1"})
    test_tag2 = Tag.create({:name => "tag2"})
    test_attraction = Attraction.create({:name => "Space Needle", :description => "none", :price => nil, :season => "Spring", :tag_ids => [test_tag1.id, test_tag2.id]})
    expect(test_attraction.tags).to(eq([test_tag1, test_tag2]))
  end

  it 'validates the presence of a name' do
    attraction = Attraction.new({:name => ""})
    expect(attraction.save).to(eq(false))
  end

  it 'validates the length of the name' do
    attraction = Attraction.new({:name => "a"*51})
    expect(attraction.save).to(eq(false))
  end

  it 'validates that the name of the Attraction is unique' do
    attraction1 = Attraction.create({:name => "Space Needle", :description => "none"})
    attraction2 = Attraction.new({:name => "Space Needle", :description => "not available"})
    expect(attraction2.save).to(eq(false))
  end

  it 'validates the presence of a description' do
    attraction = Attraction.new({:name => "space needle", :description => ""})
    expect(attraction.save).to(eq(false))
  end

  it 'validates the length of a description' do
    attraction = Attraction.new({:name => "Space Needle", :description => "a"*201})
    expect(attraction.save).to(eq(false))
  end

end
