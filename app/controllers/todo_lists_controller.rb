class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update]

  def index
    if user_signed_in?
      @todo_lists = current_user.todo_lists
    else
      @todo_lists = TodoList.all
    end
  end

  def show
  end


  def new
    @todo_list = current_user.todo_lists.build
  end

  def edit
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, noticecutom:  'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    TodoList.find(params[:id]).destroy
    flash.now[:success] = "Destroyed!"
    redirect_to :back
end

def set_todo_list
  puts params[:id]
  @todo_list = TodoList.find(params[:id])
end

def todo_list_params
  params.require(:todo_list).permit(:title)
end
end
