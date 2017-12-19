require ('spec_helper')

describe(Tag) do
  it 'has many attractions' do
    attraction1 = Attraction.create({:name => "attraction1", :description => "none", :price => nil, :season => "Spring"})
    attraction2 = Attraction.create({:name => "attraction2", :description => "none", :price => nil, :season => "Fall"})
    test_tag = Tag.create({:name => "tag1", :attraction_ids => [attraction1.id, attraction2.id]})
    expect(test_tag.attractions).to(eq([attraction1, attraction2]))
  end

  it 'validates the presence of a name' do
    tag = Tag.new({:name => ""})
    expect(tag.save).to(eq(false))
  end

  it 'validates that the name is unique' do
    tag1 = Tag.create({:name => "outdoors"})
    tag2 = Tag.create({:name => "outdoors"})
    expect(tag2.save).to(eq(false))
  end

  it 'validates the name is less than 25 characters' do
    tag = Tag.create({:name => "n"*26})
    expect(tag.save).to(eq(false))
  end

  describe '#lower_case' do
    it 'makes all letters in a tag lower case' do
      tag = Tag.create({:name => "KiDS"})
      tag2 = Tag.create({:name => "APPLES"})
      binding.pry
      expect(tag.name).to(eq("kids"))
    end
  end




end
