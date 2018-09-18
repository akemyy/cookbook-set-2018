class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end  

  def create
    atributos_cuisine = params.require(:cuisine).permit(:name)

      @cuisine = Cuisine.new(atributos_cuisine)
      @cuisine.save
      redirect_to @cuisine
        


  end
end
