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

# get '/tags/1/edit' do
#   "Hello World"
# end
