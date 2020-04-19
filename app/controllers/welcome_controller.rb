class WelcomeController < ApplicationController
  def index
    setup_date(:start_date)

    if admin?
        render :admin
    end    

    # @tasks = Task.where(date: @date.midnight..@date.end_of_day)
    @tasks = Task.where(date: @date)
  end

  def calendar        
  end

  def admin
  end
end
