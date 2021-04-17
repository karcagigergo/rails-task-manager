class TasksController < ApplicationController

    def home; end

    def all
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new # needed to instantiate the form_for
    end

    def create
        @task = Task.new(task_strong_params)
        @task.save
    
        # no need for app/views/restaurants/create.html.erb
        redirect_to task_path(@task)
    end

    private

    def task_strong_params
        params.require(:task).permit(:title, :details, :completed)
    end
end
