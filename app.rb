require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ("/") do
  attractions = Attraction.all()
  @attractions = attractions.sort { |a,b| a.name <=> b.name}
  tags = Tag.all()
  @tags = tags.sort_by { |a| a.name }
  erb(:index)
end

get ("/tag_form") do
  tags = Tag.all()
  @tags = tags.sort { |a,b| a.name <=> b.name }
  erb(:tag_form)
end

get ("/attraction_form") do
  attractions = Attraction.all()
  @attractions = attractions.sort { |a,b| a.name <=> b.name}
  tags = Tag.all()
  @tags = tags.sort { |a,b| a.name <=> b.name}
  erb(:attraction_form)
end

patch ("/tag_form") do
  name = params[:name]
  @tag = Tag.create({:name => name, :id => nil})
  if @tag.save()
    redirect("/tag_form")
  else
    @error_message1 = "No more than 25 characters"
    @error_message2 = "No blank input"
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
    redirect("/attraction_form")
  else
    @error_message1 = "No more than 50 characters for name and 200 characters for description"
    @error_message2 = "No blank inputs"
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
  redirect("/tag_form")
end

patch('/tags/:id/edit') do
  name = params[:name]
  @tag = Tag.find(params[:id].to_i)
  @tag.update({:name => name})
  redirect("/tag_form")
end

get ('/attractions/:id/edit') do
  @attraction = Attraction.find(params[:id].to_i)
  tags = Tag.all()
  @tags = tags.sort { |a,b| a.name <=> b.name}
  erb(:attraction_edit)
end

delete('/attractions/:id/edit') do
  @attraction = Attraction.find(params[:id].to_i)
  @attraction.delete()
  redirect("/attraction_form")
end

patch('/attractions/:id/edit') do
  name = params[:name]
  description = params[:description]
  season = params[:seasons]
  price = params[:price]
  tag_ids = params[:tag_ids]
  remove_seasons = params[:remove_seasons]
  remove_tags = params[:remove_tag_ids]
  @attraction = Attraction.find(params[:id].to_i)
  @attraction.custom_update(name, description, season, price, tag_ids, remove_seasons, remove_tags)
  redirect("/attraction_form")
end

get ('/attractions/:id') do
  @attraction = Attraction.find(params[:id].to_i)
  erb(:attraction_details)
end

patch ('/search') do
  tag_ids = params[:tag_ids]
  seasons = params[:seasons]
  minimum = params[:minimum].to_f
  maximum = params[:maximum].to_f
  inclusive = params[:inclusive]
  if inclusive = "inclusive"
    attractions = Attraction.search_inclusive(tag_ids, seasons, minimum, maximum)
  else
    attractions = Attraction.search_results(tag_ids, seasons, minimum, maximum)
  end
  @attractions = attractions.sort { |a,b| a.name <=> b.name}
  @tags_list = ""
  if tag_ids
    tag_ids.each do |tag_id|
      tag_id.to_i
      tag = Tag.find(tag_id)
      @tags_list.concat(tag.name).concat(", ")
    end
    @tags_list.chop!.chop!
  end
  @seasons_list = ""
  if seasons
    seasons.each do |season|
      @seasons_list.concat(season + ", ")
    end
    @seasons_list.chop!.chop!
  end
  if minimum > 0.0 && maximum != 0.0
    @prices_list = "$" + minimum.to_s + " to $" + maximum.to_s
  elsif minimum > 0.0 && maximum == 0.0
    @prices_list = "More than $" + minimum.to_s
  elsif minimum == 0.0 && maximum > 0
    @prices_list = "Less than $" + maximum.to_s
  else
    @prices_list = ""
  end
  erb(:searching_results)
end
