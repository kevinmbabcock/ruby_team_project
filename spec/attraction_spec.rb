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
end
