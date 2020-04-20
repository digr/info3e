class TasksController < ApplicationController
  before_action :authorized_teacher

  def index
    @tasks = Task.all
  end

  def new
    setup_date(:date)

    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to "/?start_date=#{@task.date}"
    else
      redirect_to "/tasks/new?date=#{@task.date}"
    end
  end

  private

  def task_params
    params.require(:task).permit(:cource_id, :text, :date, :content, documents: [])
  end
end
