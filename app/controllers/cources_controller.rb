class CourcesController < ApplicationController
  def index
    @cources = Cource.all
  end

  def edit
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
      render :new
    end
  end

  def update
    @cource = Cource.find(params[:id])

    if @cource.update(cource_params)
      redirect_to :cources
    else
      render :edit
    end
  end

  private

  def cource_params
    params.require(:cource).permit(:title, :assessmnt)
  end
end
