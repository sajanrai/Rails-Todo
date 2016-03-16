	class TodoItemsController < ApplicationController
		def create
			@todo_list = TodoList.find(params[:todo_list_id])
			@todo_item = @todo_list.todo_items.create(params[:todo_item].permit(:content))
			respond_to do |format|
				if @todo_item.save
					format.html { redirect_to @todo_list, notice: 'Todo item was successfully created.' }
					format.json { render :show, status: :created, location: @todo_list }
				else
					format.html { render :new }
					format.json { render json: @todo_item.errors, status: :unprocessable_entity }
				end
			end
		end
		def new
			@todo_list = TodoList.find(params[:todo_list_id])
			@todo_item = @todo_list.todo_items.create(:content => params[:todo_item])
		end
		def update
			@todo_list = TodoList.find(params[:todo_list_id])
			@todo_item = @todo_list.todo_items.update(status: true)

		end

		def destroy
			puts "*********************************"
			puts params[:id]
			puts TodoItem.find(params[:id])
			TodoItem.find(params[:id]).destroy
			flash[:success] = "User deleted"
			redirect_to :back
		end

		def updateStatus
			puts "hello"
			@todo_list = TodoList.find(params[:list])
			@todo_item = TodoItem.find(params[:id])
			status = params[:status]
			puts status
			status1 = (status == "true") ? false : true;
			puts status1
			@todo_item = @todo_item.update(status: status1)
			redirect_to :back
		end
	end
