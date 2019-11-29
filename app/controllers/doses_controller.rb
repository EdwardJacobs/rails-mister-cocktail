class DosesController < ApplicationController
  def new
    @dose = dose.new
  end

  def create
    @dose = dose.new(params.require(:dose).permit(:description, :ingredient_id, :cocktail_id))
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail_id = @cocktail.id

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end
end
