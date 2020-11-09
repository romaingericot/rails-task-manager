class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError

    # no need for app/views/restaurants/create.html.erb
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # Will raise ActiveModel::ForbiddenAttributesError

    # no need for app/views/restaurants/update.html.erb
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

    # no need for app/views/restaurants/destroy.html.erb
    # redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
