class SolutionsController < ApplicationController
  helper_method :cource

  def index
    cource = Cource.find_by(id: params[:cource_id] || session[:cource_id])

    not_found if cource.nil?

    session[:cource_id] = cource.id

    @solutions = Solution.where(date: date, cource: cource).order(created_at: :asc)
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(solution_params)

    if @solution.save
      redirect_to :solutions
    else
      render :new
    end
  end

  def cource
    Cource.find_by(id: session[:cource_id])
  end

  private

  def solution_params
    params.require(:solution).permit(:user_id, :cource_id, :date, documents: [])
  end
end
