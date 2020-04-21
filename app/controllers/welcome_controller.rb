class WelcomeController < ApplicationController
  def index
    session[:start_date] = ( Date.parse(params[:start_date] || session[:start_date]) rescue Date.today).to_s

    if admin?
        render :admin
    end

    @tasks = Task.where(date: date)
  end

  def calendar
  end

  def admin
  end
end
