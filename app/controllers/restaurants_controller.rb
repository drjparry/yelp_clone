class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params)
    redirect_to '/restaurants'
  end

  def create
    puts "Rating via slider: #{params[:rating]}"
    Restaurant.create(name: params[:name], rating: params[:rating])
    redirect_to '/restaurants'
  end
end
