require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ("/") do
  @tags = Tag.all()
  @attractions = Attraction.all()
  erb(:index)
end
