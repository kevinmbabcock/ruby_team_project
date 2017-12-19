require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ("/") do
  @attractions = Attraction.all()
  @tags = Tag.all()
  erb(:index)
end

get ("/tag_form") do
  @tags = Tag.all()
  erb(:tag_form)
end

get ("/attraction_form") do
  @attractions = Attraction.all()
  @tags = Tag.all()
  erb(:attraction_form)
end

patch ("/tag_form") do
  name = params[:name]
  @tag = Tag.create({:name => name, :id => nil})
  if @tag.save()
    @tags = Tag.all()
    erb(:tag_form)
  else
    erb(:error)
  end
end

patch ('/attraction_form') do
  name = params[:name]
  description = params[:description]
  price = params[:price]
  season = params[:seasons]
  tag_ids = params[:tag_ids]

  @attraction = Attraction.create({:name => name, :description => description, :price => price, :season => season, :tag_ids => tag_ids, :id => nil})
  if @attraction.save()
    @attractions = Attraction.all()
    @tags = Tag.all()
    erb(:attraction_form)
  else
    erb(:error)
  end
end

get ('/tags/:id/edit') do
  @tag = Tag.find(params[:id].to_i)
  erb(:tag_edit)
end

delete('/tags/:id/edit') do
  @tag = Tag.find(params[:id].to_i)
  @tag.delete()
  @tags = Tag.all()
  erb(:tag_form)
end

patch('/tags/:id/edit') do
  name = params[:name]
  @tag = Tag.find(params[:id].to_i)
  @tag.update({:name => name})
  @tags = Tag.all()
  erb(:tag_form)
end

get ('/attractions/:id/edit') do
  @attraction = Attraction.find(params[:id].to_i)
  @tags = Tag.all()
  erb(:attraction_edit)
end

delete('/attractions/:id/edit') do
  @attraction = Attraction.find(params[:id].to_i)
  @attraction.delete()
  @attractions = Attraction.all()
  @tags = Tag.all()
  erb(:attraction_form)
end


patch('/attractions/:id/edit') do
  name = params[:name]
  description = params[:description]
  price = params[:price]
  season = params[:seasons]
  tag_ids = params[:tag_ids]

  @attraction = Attraction.find(params[:id].to_i)
  @attraction.update({:name => name, :description => description, :price => price, :season => season, :tag_ids => tag_ids})
  
  @attractions = Attraction.all()
  @tags = Tag.all()
  erb(:attraction_form)
end

get ('/attractions/:id') do
  @attraction = Attraction.find(params[:id].to_i)
  erb(:attraction_details)
end

patch ('/tags-search') do
  tag_ids = params[:tag_ids]
  @tags_list = ""
  tag_ids.each do |tag_id|
    tag_id.to_i
    tag = Tag.find(tag_id)
    @tags_list.concat(tag.name).concat(", ")
  end
  @tags_list.chop!.chop!

  @attractions = []
  tag_ids.each do |id|
    tag = Tag.find(id)
    attractions = tag.attractions
    attractions.each do |attraction|
      @attractions.push(attraction)
    end
  end




  erb(:searching_results)
end
