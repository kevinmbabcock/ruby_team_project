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
