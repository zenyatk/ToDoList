class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks_pending = Task.where(completed: false)
    @tasks_completed = Task.where(completed: true)
    @tasks = Task.all
    
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

 # app/controllers/tasks_controller.rb

def update
    if @task.update(task_params.merge(completed: true, completed_at: Time.current))
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  
def complete
    @task = Task.find(params[:id])
    @task.update(completed: true, completed_at: Time.current)
    redirect_to tasks_path, notice: 'Task was successfully marked as completed.'
end

  def completed_index
    @completed_tasks = Task.where(completed: true)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
