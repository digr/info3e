class CourcesController < ApplicationController
  def index
    @cources = Cource.all
  end

  def show
    @cource = Cource.find(params[:id])
  end

  def new
    @cource = Cource.new
  end

  def create
    @cource = Cource.new(cource_params)

    if @cource.save
      redirect_to :cources
    else
      render 'new'
    end
  end

  private

  def cource_params
    params.require(:cource).permit(:title, :text)
  end
end
