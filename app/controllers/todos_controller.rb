class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
    def index
      if params[:query].present?
        @todos = Todo.search(params[:query])
      else
        @todos = Todo.all
      end
    end
  
    def show
      # Show individual todo details
    end
  
    def new
        @todo = Todo.new
    end
  
    def create
      @todo = Todo.new(todo_params)
  
      if @todo.save
        redirect_to todos_path, notice: 'Todo was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # Render the form to edit a todo
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to todos_path, notice: 'Todo was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @todo.destroy
      redirect_to todos_path, notice: 'Todo was successfully destroyed.'
    end
  
    private
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
  end