class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = @cocktail.doses.build
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:dose_id])
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
