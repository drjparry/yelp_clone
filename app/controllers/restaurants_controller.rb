class RestaurantsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!, :except => [:index, :show]

  def index
     @restaurants = Restaurant.all
=======
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
<<<<<<< HEAD
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to '/restaurants'
    else
=======
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user= current_user
    
    if @restaurant.save
      redirect_to '/restaurants'
    else  
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
      render 'new'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
<<<<<<< HEAD
    if user_owns_restaurant?
    @restaurant.update(restaurant_params)
    else
      flash[:notice]= "Cannot edit a restaurant you didn't create"
    end
    redirect_to '/restaurants'
  end

  def user_owns_restaurant?
    @restaurant.user == current_user
=======
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
<<<<<<< HEAD
    flash[:notice] = "Restaurant deleted"
    redirect_to '/restaurants'
  end


end
=======

    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end
end
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
