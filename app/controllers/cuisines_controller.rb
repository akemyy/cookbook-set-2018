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
      if @cuisine.save
        flash[:success] = 'Cadastrado com sucesso'
        redirect_to @cuisine
      else
        flash[:alert] = 'Campo obrigatório em branco'
        render :new
      end
    end
end
