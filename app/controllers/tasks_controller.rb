class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :destroy]

    def home; end

    def index
        @tasks = Task.all
    end

    def show; end

    def new
        @task = Task.new # needed to instantiate the form_for
    end

    def create
        @task = Task.new(task_strong_params)
        @task.save
        # no need for app/views/tasks/create.html.erb
        redirect_to task_path(@task)
    end

    def edit; end

    def update
        @task.update(task_strong_params)
        # no need for app/views/restaurants/update.html.erb
        redirect_to task_path(@task)
    end

    def destroy
        @task.destroy
        # no need for app/views/restaurants/destroy.html.erb
        redirect_to tasks_path
    end

    private

    def task_strong_params
        params.require(:task).permit(:title, :details, :completed)
    end

    def find_task
        @task = Task.find(params[:id])
    end

end
