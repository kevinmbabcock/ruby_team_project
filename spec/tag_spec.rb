require ('spec_helper')

describe(Tag) do
  it("has many attractions") do
    attraction1 = Attraction.create({:name => "attraction1", :description => "none", :price => nil, :season => "Spring"})
    attraction2 = Attraction.create({:name => "attraction2", :description => "none", :price => nil, :season => "Fall"})
    test_tag = Tag.create({:name => "tag1", :attraction_ids => [attraction1.id, attraction2.id]})
    expect(test_tag.attractions).to(eq([attraction1, attraction2]))
  end

  it 'validates the presence of a name' do
    tag = Tag.new({:name => ""})
    expect(tag.save).to(eq(false))
  end
end
