class TasksController < ApplicationController
  before_action :authorized_teacher

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to "/"
    else
      redirect_to "new_task"
    end
  end

  def destroy
    Task.find_by(id: params[:task_id]).destroy
    redirect_to "tasks"
  end

  private

  def task_params
    params.require(:task).permit(:cource_id, :text, :date, :content, documents: [])
  end
end
