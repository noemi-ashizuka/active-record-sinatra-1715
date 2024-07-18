require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'

# router + controller
# HTTP VERBS
# GET (get the data)
# POST (to creata data)
# PUT/PATCH (to update)
# DELETE (to delete)

get "/" do
  # get restaurants from the DB
  # pass the restaurants to the view to display
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  id = params[:id]
  # get the data of the restaurant with the id
  @restaurant = Restaurant.find(id)
  erb :show
end

post "/restaurants" do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect '/'
end
