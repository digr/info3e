class WelcomeController < ApplicationController
  def index
    tasks_date = DateTime.parse(params[:start_date]) rescue DateTime.now
    @date = I18n.l(tasks_date, format: "%A, %-d %b %Y", locale: :'ru')
    @today = "Сегодня, " if DateTime.now.day == tasks_date.day
  end

  def calendar        
  end
end
