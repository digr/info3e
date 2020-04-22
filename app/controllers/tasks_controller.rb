class TasksController < ApplicationController
  before_action :authorized_teacher

  def index
    @tasks = Task.all.order(date: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to :root
    else
      redirect_to :new_task
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy if @task

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:cource_id, :text, :date, :content, documents: [])
  end
end
